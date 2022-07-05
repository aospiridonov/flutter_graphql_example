import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/view/review/review_feed.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: 'Reviews',
  );

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        ListTile(title: Text('Live Stream of Reviews')),
        Expanded(child: ReviewFeed()),
      ],
    );
  }
}
