import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitUp]
  );

  runApp(const RootRestorationScope(
    restorationId: "root",
    child: MyApp())
  );
}