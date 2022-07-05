import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> makeClient({
  required String uri,
  String? subscriptionUri,
}) {
  Link link = HttpLink(uri);
  if (subscriptionUri != null) {
    final WebSocketLink webSocketLink = WebSocketLink(subscriptionUri);
    link = Link.split(
      (request) => request.isSubscription,
      webSocketLink,
      link,
    );
  }
  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: link,
    ),
  );
}
