import 'dart:convert';

import 'package:hamidreza_test_march8/core/model/constants/url_endpoints.dart';
import 'package:hamidreza_test_march8/core/model/responses/product.dart';
import 'package:hamidreza_test_march8/core/model/responses/user.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Api {
  //method for calling user list and creating list of users
  Future<List<User>> getUsers() async {
    Response res = await get(
      Uri.parse(ApiEndPoints.url),
    );

    final responseBod = jsonDecode(res.body);

    return List<User>.from(responseBod['data'].map((e) => User.fromJson(e)));
  }

  Future<List<Product>> getProducts() async {
    Response res = await get(
      Uri.parse(ApiEndPoints.urlProduct),
    );

    final responseBod = jsonDecode(res.body);

    return List<Product>.from(
        responseBod['data'].map((e) => Product.fromJson(e)));
  }
}
