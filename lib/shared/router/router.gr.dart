// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/model/responses/user.dart';
import '../../ui/screens/form_screen/form_view.dart';
import '../../ui/screens/login_screen/login_view.dart';
import '../../ui/screens/product_screen/product_view.dart';
import '../../ui/screens/users_screen/users_view.dart';

class Routes {
  static const String usersView = '/users-view';
  static const String productView = '/product-view';
  static const String formView = '/form-view';
  static const String loginView = '/login-view';
  static const all = <String>{
    usersView,
    productView,
    formView,
    loginView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.usersView, page: UsersView),
    RouteDef(Routes.productView, page: ProductView),
    RouteDef(Routes.formView, page: FormView),
    RouteDef(Routes.loginView, page: LoginView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    UsersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UsersView(),
        settings: data,
      );
    },
    ProductView: (data) {
      final args = data.getArgs<ProductViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductView(
          key: args.key,
          selectedUser: args.selectedUser,
        ),
        settings: data,
      );
    },
    FormView: (data) {
      final args = data.getArgs<FormViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => FormView(
          key: args.key,
          selectedUser: args.selectedUser,
        ),
        settings: data,
      );
    },
    LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProductView arguments holder class
class ProductViewArguments {
  final Key key;
  final User selectedUser;
  ProductViewArguments({this.key, @required this.selectedUser});
}

/// FormView arguments holder class
class FormViewArguments {
  final Key key;
  final User selectedUser;
  FormViewArguments({this.key, @required this.selectedUser});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key key;
  LoginViewArguments({this.key});
}
