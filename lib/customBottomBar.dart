import 'package:flutter/material.dart';
import 'main.dart';

class customBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> barItems = [];
  var style = TextStyle(fontWeight: FontWeight.normal, color: Colors.black);

  customBottomBar() {
    barItems.add(
      new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        backgroundColor: theme.primaryColor,
        title: Text(
          'Explore',
          style: style,
        ),
      ),
    );
    barItems.add(
      new BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        backgroundColor: theme.primaryColor,
        title: Text(
          'Watchlist',
          style: style,
        ),
      ),
    );
    barItems.add(
      new BottomNavigationBarItem(
        icon: Icon(Icons.local_offer),
        backgroundColor: theme.primaryColor,
        title: Text(
          'Deals',
          style: style,
        ),
      ),
    );
    barItems.add(
      new BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        backgroundColor: theme.primaryColor,
        title: Text(
          'Notifications',
          style: style,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: barItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
