import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/view/review/display_reviews.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewFeed extends StatelessWidget {
  const ReviewFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Subscription(
      options: SubscriptionOptions(
        document: gql(
          r'''
            subscription reviewAdded {
              reviewAdded {
                stars, commentary, episode
              }
            }
          ''',
        ),
      ),
      builder: (result) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ResultAccumulator<Map<String, dynamic>?>.appendUniqueEntries(
          latest: result.data,
          builder: (context, {results}) => DisplayReviews(
            reviews: results?.reversed.toList(),
          ),
        );
      },
    );
  }
}
