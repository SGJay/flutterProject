import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Widget appBarSection = AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        semanticLabel: 'menu',
      ),
      onPressed: () {
        print('menu');
      },
    ),
    title: Text(
      'HOME',
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
          semanticLabel: 'search',
        ),
        onPressed: () {
          print('search');
        },
      ),
      IconButton(
        icon: Icon(
          Icons.tune,
          semanticLabel: 'filter',
        ),
        onPressed: () {
          print('filter');
        },
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSection,
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        childAspectRatio: 8 / 9,
        children: <Widget>[Card()],
      ),
    );
  }
}
