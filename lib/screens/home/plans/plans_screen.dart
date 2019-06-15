import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:magic_carpet/widgets/pull_to_retry_prompt.dart';
import 'package:magic_carpet/services/heracles.dart';

import 'package:magic_carpet/types.dart';

import 'widgets/index.dart';
import 'plans_placeholder.dart';

class PlansScreen extends StatelessWidget {

  List plans = [];

  @override
  Widget build(BuildContext context) {
    return Refreshable<List<Package>>(
      fetcher: Heracles.of(context).fetchPackages,
      onLoading: (context) => PlansPlaceholder(),
      onFailure: (context, exception) => PullToRetryPrompt(),
      onSuccess: (context, properties) {
        return MagicContainer(
          body: [
            PlansHeader(showButton: plans.isNotEmpty),
            SizedBox(height: 20),
            PlansEntry(plans: plans),
          ],
        );
      },
    );
  }
}
 