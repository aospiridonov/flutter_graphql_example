import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/utils/graphql_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ClientProvider extends StatelessWidget {
  ClientProvider({
    Key? key,
    required this.child,
  })  : client = makeClient(uri: ''),
        super(key: key);

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
