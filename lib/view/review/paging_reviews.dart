import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/view/review/display_reviews.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PagingReviews extends StatelessWidget {
  const PagingReviews({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    icon: Icon(Icons.description),
    label: 'Paging',
  );

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        // if we have cached results, don't clobber them
        fetchPolicy: FetchPolicy.cacheFirst,
        document: gql(r'''
          query Reviews($page: Int!) {
            reviews(page: $page) {
              page
              reviews {
                id
                episode
                stars
                commentary
              }
            }
          }
        '''),
        variables: {'page': 0},
      ),
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading && result.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final nextPage = result.data?['reviews']['page'] + 1;

        return Column(
          children: <Widget>[
            Expanded(
              child: DisplayReviews(
                reviews: result.data?['reviews']['reviews']
                    .cast<Map<String, dynamic>>(),
              ),
            ),
            (result.isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      fetchMore!(
                        FetchMoreOptions.partial(
                          variables: {'page': nextPage},
                          updateQuery: (existing, newReviews) => ({
                            'reviews': {
                              'page': newReviews?['reviews']['page'],
                              'reviews': [
                                ...existing?['reviews']['reviews'],
                                ...newReviews?['reviews']['reviews']
                              ],
                            }
                          }),
                        ),
                      );
                    },
                    child: Text('LOAD PAGE ${nextPage + 1}'),
                  ),
          ],
        );
      },
    );
  }
}
