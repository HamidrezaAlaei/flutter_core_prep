import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/shared/locator/locator.dart';
import 'package:hamidreza_test_march8/shared/router/router.gr.dart' as R;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive
  Hive.initFlutter();

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
