import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/app_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RestorationMixin {
  final _RestorableState _appState = _RestorableState();

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: "app",
    );
  }
  
  @override
  String? get restorationId => "wrapper";
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_appState, "state");
  }
}

class _RestorableState extends RestorableListenable<AppState> {
  @override
  AppState createDefaultValue() {
    return AppState();
  }

  @override
  AppState fromPrimitives(Object? data) {
    final appState = AppState();
    // Do something with the data here using appstate object
    return appState;
  }

  @override
  Object? toPrimitives() {
    return value;
  }
  
}