import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:hamidreza_test_march8/ui/screens/form_screen/form_view.dart';
import 'package:hamidreza_test_march8/ui/screens/login_screen/login_view.dart';
import 'package:hamidreza_test_march8/ui/screens/product_screen/product_view.dart';
import 'package:hamidreza_test_march8/ui/screens/users_screen/users_view.dart';

@MaterialAutoRouter(routes: [
  //TODO: Create Routes here...
  MaterialRoute(page: UsersView),
  MaterialRoute(page: ProductView),
  MaterialRoute(page: FormView),
  MaterialRoute(page: LoginView),
  CustomRoute(page: UsersView, transitionsBuilder: TransitionsBuilders.fadeIn)
])
class $Router {}
