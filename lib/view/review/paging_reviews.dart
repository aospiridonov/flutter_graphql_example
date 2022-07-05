import 'package:flutter/material.dart';

class PagingReviews extends StatelessWidget {
  const PagingReviews({Key? key}) : super(key: key);

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    icon: Icon(Icons.description),
    label: 'Paging',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Paging'),
    );
  }
}
