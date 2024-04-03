import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.restorationId, required this.child, required this.onTap});

  final String? restorationId;
  final Widget child;

  final void Function(int) onTap;

  _getSelectedInndex(String location){
    switch (location) {
      case "/list":
        return 0;
      case "/favourites":
        return 1;
      case "/search":
        return 2;
      case "/settings":
        return 3;
      default:
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = _getSelectedInndex(GoRouterState.of(context).matchedLocation);
    return RestorationScope(
      restorationId: restorationId,
      child: CupertinoPageScaffold(
        child: Column(children: [
          Expanded(child: child),
          CupertinoTabBar(currentIndex: index,
           onTap: onTap,
           items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Favourites"),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "Settings"),
          ])
        ],)
      ),
    );
  }
}