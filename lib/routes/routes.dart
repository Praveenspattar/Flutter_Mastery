import 'package:flutter/cupertino.dart';
import 'package:flutter_mastery/screens/favourites_screen.dart';
import 'package:flutter_mastery/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

import '../app/my_app.dart';
import '../screens/home_screen.dart';
import '../screens/icecream_screen.dart';
import '../screens/search_screen.dart';
import '../widgets/fade_transition_page.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

//maybe the below variable is router
var routes = [
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state, child) {
      return CupertinoPage(
        restorationId: "router.shell",
        child: HomeScreen( 
          restorationId: "home",
           child: child,
           onTap: (index) {
             if (index == 0) {
               context.go("/list");
             }
             else if(index == 1){
              context.go("/favorites");
             }
             else if(index == 2){
              context.go("/search");
             }
             else if(index == 3){
              context.go("/settings");
             }
           },
        ),
      );
    },
    routes: [
      GoRoute(
        path: "/list",
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            key: state.pageKey,
            restorationId: "router.list",
            child: const IcecreamScreen(restorationId: "list")
          );
        },
        routes: [
          _detailedRoute(),
        ]
      ),
      GoRoute(
        path: "/favourites",
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            key: state.pageKey,
            restorationId: "router.favourites",
            child: const FavouritesScreen()
          );
        },
        routes: [
          _detailedRoute(),
        ]
      ),
      GoRoute(
        path: "/search",
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            key: state.pageKey,
            restorationId: "router.search",
            child: const SearchScreen()
          );
        },
        routes: [
          _detailedRoute(),
        ]
      ),
      GoRoute(
        path: "/settings",
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            key: state.pageKey,
            restorationId: "router.settings",
            child: const SettingsScreen()
          );
        },
        routes: [
          _detailedRoute(),
        ]
      )
    ]
  )
];

_detailedRoute(){
  return GoRoute(
    path: "details/:id",
    parentNavigatorKey: rootNavigatorKey,
    pageBuilder: (context, state) {
      final id = int.tryParse(state.pathParameters["id"]!);
      return CupertinoPage(
         restorationId: "router.details",
          fullscreenDialog: true,
          child: Container());
    },
  );
} 