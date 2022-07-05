import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/model/review/review.dart';

class DisplayReviews extends StatefulWidget {
  const DisplayReviews({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  final List<Map<String, dynamic>?>? reviews;

  @override
  State<DisplayReviews> createState() => _DisplayReviewsState();
}

class _DisplayReviewsState extends State<DisplayReviews> {
  List<Map<String, dynamic>?> get reviews => widget.reviews!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: ListView(
        children: reviews.map<Widget>(displayRaw).toList(),
      ),
    );
  }

  Widget displayRaw(Map<String, dynamic>? raw) => Card(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          //height: 150,
          child: Text(displayReview(raw)),
        ),
      );
}
