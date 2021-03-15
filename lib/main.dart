import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/core/model/request/login_request/chached_login_request.dart';
import 'package:hamidreza_test_march8/shared/locator/locator.dart';
import 'package:hamidreza_test_march8/shared/router/router.gr.dart' as R;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //Hive
  // var appDir = await getApplicationDocumentsDirectory();
  // Hive.initFlutter(appDir.path);
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var appDir = await getApplicationDocumentsDirectory();
    var path = appDir.path;
    Hive.init(path);
  }

  //registering the adapter for the cached class.
  Hive.registerAdapter(CachedLoggedUserAdapter());

  // Sets up the location so that all the singletons can get initialzed.
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: R.Router().onGenerateRoute,
      debugShowCheckedModeBanner: false,
      //Initializing the router by giving the initial route
      initialRoute: R.Routes.loginView,
    );
  }
}
