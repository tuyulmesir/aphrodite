import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

typedef Fetcher<T> = Future<T> Function();
typedef ErrorWidgetBuilder = Widget Function(BuildContext context, Exception e);
typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);

/// A refreshable widget.
///
/// This is supposed to be an simpler and more opinionated version of
/// [FutureBuilder]. it requires the [Fetcher] of the [Future] instead of the
/// [Future] itself such that in case of [Exception] raised, it knows how to
/// acquire new [Future] and recover from that [Exception].
///
/// [Refreshable] has **4** distinct state, it displays differently on
/// different state.
///
/// - It displays [onLoading] while waiting on the [Future] if the previous
/// [Future] is not a success.
/// - It displays [onBeforeReload] while waiting on the [Future] if the
/// previous [Future] is a success.
/// - It displays [onSuccess] on successful resolve of the [Future].
/// - It displays [onFailure] on erroneous resolve of the [Future].
///
/// For the page to be refreshable on that state, the builder of that state must
/// returns an instance of [ListView] descendant.
///
/// Note that [Refreshable] has a [timeout] it defaults to 5 seconds. it
/// denotes the longest time [Refreshable] will wait on the [Future] before
/// taking that as an error.
class Refreshable<T> extends StatefulWidget {
  static final Logger log = Logger('Refreshable');
  final RefreshableController<T> controller;
  final Fetcher<T> fetcher;
  final DataWidgetBuilder<T> onSuccess;
  final ErrorWidgetBuilder onFailure;
  final WidgetBuilder onLoading;
  final DataWidgetBuilder<T> onBeforeReload;
  final Duration timeout;

  static const _defaultTimeout = Duration(seconds: 5);
  static Widget _defaultLoading(BuildContext context) =>
      Center(child: CircularProgressIndicator());

  Refreshable({
    Key key,
    RefreshableController<T> controller,
    Duration timeout = _defaultTimeout,
    @required Fetcher<T> fetcher,
    @required DataWidgetBuilder<T> onSuccess,
    @required ErrorWidgetBuilder onFailure,
    WidgetBuilder onLoading = _defaultLoading,
    DataWidgetBuilder<T> onBeforeReload,
  }) : this._(
          key: key,
          controller: controller ?? RefreshableController<T>(),
          timeout: timeout,
          fetcher: fetcher,
          onSuccess: onSuccess,
          onFailure: onFailure,
          onLoading: onLoading,
          onBeforeReload:
              onBeforeReload ?? (context, data) => onLoading(context),
        );

  Refreshable._({
    Key key,
    @required this.controller,
    @required this.timeout,
    @required this.fetcher,
    @required this.onSuccess,
    @required this.onFailure,
    @required this.onLoading,
    @required this.onBeforeReload,
  }) : super(key: key);

  @override
  _RefreshableState<T> createState() => _RefreshableState<T>();
}

class _RefreshableState<T> extends State<Refreshable<T>> {
  RefreshableController<T> get controller => widget.controller;
  Future<T> future;

  @override
  void initState() {
    super.initState();
    this.future = widget.fetcher();
    controller._subscribe(refetch);
  }

  @override
  void dispose() {
    controller._unsubscribe(refetch);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: FutureBuilder<T>(
        future: future,
        builder: (context, snapshot) {
          controller._value = snapshot;
          Refreshable.log.fine(snapshot);
          if (snapshot.connectionState != ConnectionState.done) {
            if (snapshot.hasData)
              return widget.onBeforeReload(context, snapshot.data);
            return widget.onLoading(context);
          }
          if (snapshot.hasData) return widget.onSuccess(context, snapshot.data);
          return widget.onFailure(context, snapshot.error);
        },
      ),
      onRefresh: refetch,
    );
  }

  Future<T> refetch() {
    Refreshable.log.fine('Refetching');
    setState(() {
      future = widget.fetcher().timeout(widget.timeout);
    });
    return future;
  }
}

/// A [Refreshable] controller.
///
/// This class can be used to request refetch to the [Refreshable]. And listen
/// to the changes of [AsyncSnapshot] of [FutureBuilder] inside [Refreshable].
class RefreshableController<T> extends ChangeNotifier {
  RefreshableController()
      : this._snapshot = AsyncSnapshot.nothing(),
        this._previousSnapshot = AsyncSnapshot.nothing();

  AsyncSnapshot<T> _snapshot;
  AsyncSnapshot<T> _previousSnapshot;
  get snapshot => _snapshot;
  get previousSnapshot => _previousSnapshot;

  /// Setting [_value] is intentionally private. as it must be only editable
  /// from inside [Refreshable].
  set _value(AsyncSnapshot<T> newValue) {
    if (_snapshot == newValue) return;
    _previousSnapshot = _snapshot;
    _snapshot = newValue;
    notifyListeners();
  }

  /// [_fetchNotifier] is built to notify [Refreshable] when client requests for
  /// refetch. Request to [refetch] is public, but to listen to [refetch]
  /// request is exclusive for [Refreshable].
  ///
  /// Subscription is done via [_subscribe] and [_unsubscribe].
  ChangeNotifier _fetchNotifier = ChangeNotifier();
  void refetch() => _fetchNotifier.notifyListeners();
  void _subscribe(VoidCallback listener) =>
      _fetchNotifier.addListener(listener);
  void _unsubscribe(VoidCallback listener) =>
      _fetchNotifier.removeListener(listener);
}
