import 'package:flutter/cupertino.dart';
import 'package:flutter_mastery/data/preferences.dart';
import 'package:flutter_mastery/routes/routes.dart';
import 'package:flutter_mastery/themes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _appState.value),
        ChangeNotifierProvider(create: (_) => Preferences()..load())
      ],
      child: CupertinoApp.router(
        theme: MyTheme.themeData,
        debugShowCheckedModeBanner: false,
        restorationScopeId: "app",
        routerConfig: GoRouter(
          navigatorKey: rootNavigatorKey,
          restorationScopeId: "router",
          initialLocation: "/list",
          redirect: (context, state) {
            if (state.path == "/") {
              return "/list";
            }
            return null;
          },
          routes: routes,
        ),
      ),
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