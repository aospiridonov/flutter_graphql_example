import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/view/pages.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'utils/app_constans.dart';

import 'view/client/client_provider.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

final graphqlEndpoint = 'http://${App.host}:3000/graphql';
final subscriptionEndpoint = 'ws://${App.host}:3000/subscriptions';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: graphqlEndpoint,
      subscriptionUri: subscriptionEndpoint,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onNavigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: [
        const EpisodePage(),
        const ReviewsPage(),
        const PagingReviews()
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          EpisodePage.navItem,
          ReviewsPage.navItem,
          PagingReviews.navItem,
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onNavigateTo,
      ),
    );
  }
}
