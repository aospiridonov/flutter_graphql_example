import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/model/episode/episode.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HeroForEpisode extends StatelessWidget {
  const HeroForEpisode({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(r'''
          query HeroForEpisode($ep: Episode!) {
            hero(episode: $ep) {
              __typename
              name
              ... on Droid {
                primaryFunction
              }
              ... on Human {
                height
                homePlanet
              }
            }
          }
        '''),
        variables: <String, String>{
          'ep': episodeToJson(episode),
        },
      ),
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        return Column(
          children: <Widget>[
            if (result.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (result.data != null)
              Text(
                getPrettyJSONString(result.data),
              ),
            ElevatedButton(
              onPressed: result.isNotLoading ? refetch : null,
              child: const Text('REFETCH'),
            ),
          ],
        );
      },
    );
  }
}
