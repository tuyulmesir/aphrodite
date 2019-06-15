import 'package:flutter/material.dart';
import 'package:magic_carpet/coconut_ivory/coconut_ivory.dart';
import 'package:magic_carpet/widgets/pull_to_retry_prompt.dart';
import 'package:magic_carpet/services/heracles.dart';

import 'package:magic_carpet/types.dart';

import 'widgets/index.dart';
import 'discover_placeholder.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Refreshable<List<Package>>(
      fetcher: Heracles.of(context).fetchPackages,
      onLoading: (context) => ExplorePlaceholder(),
      onFailure: (context, exception) => PullToRetryPrompt(),
      onSuccess: (context, properties) {
        return MagicContainer(
          body: [
            DiscoverHeader(),
            SizedBox(height: 20),
            DiscoverRecommendation(),
          ],
        );
      },
    );
  }
}
