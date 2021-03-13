import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/core/model/constants/hive_names.dart';
import 'package:hamidreza_test_march8/core/model/constants/user_pass_test.dart';
import 'package:hamidreza_test_march8/core/model/request/login_request/login_request.dart';
import 'package:hamidreza_test_march8/core/services/functional_services/hive_service.dart';
import 'package:hamidreza_test_march8/shared/locator/locator.dart';
import 'package:hamidreza_test_march8/shared/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final HiveService _hiveService = locator<HiveService>();
  final GlobalKey<FormState> loginKey = GlobalKey();
  Map<String, dynamic> formValues = Map();

  LoginRequest loginRequest = LoginRequest();
  bool rememberPassword = false;
  bool keepLoggedIn = false;

  onModelReady() async {
    //TODO: get the inforamtion from cache and set the keepLoggedIN and rememberPassword
  }

  ///cache logged user
  ///
  ///
  ///
  Future<void> cacheLoggedUser(LoginRequest loginRequest) async {
    _hiveService.cache(loginRequest, HiveConst.boxName, HiveConst.loggedUser);
  }

  Future<LoginRequest> releaseLoggedUser() async {
    return _hiveService.retrieve(HiveConst.boxName, HiveConst.loggedUser);
  }

  void navigateSuccess() {
    _navigationService.navigateTo(Routes.usersView);
  }

  //function for validation of each field in the form.
  String validateUserName(String text) {
    if (text != null && text.length > 0) {
      return null;
    } else
      return "username cannot be empty";
  }

  //function for validation of each field in the form.
  String validatePassWord(String text) {
    if (text != null && text.length > 8) {
      return null;
    } else
      return "Password should be 8 characters or more";
  }

  void validateForm() {
    final validate = loginKey.currentState.validate();
    if (!validate) {
      return;
    }
    loginKey.currentState.save();
    _validateResults();
  }

  void saveForm<T>(String name, T value) {
    formValues[name] = value;
    loginRequest[name] = value;
    // print(name);
    // print(user.toJson());
  }

  //checking to see if data read from user is correct.
  void _validateResults() {
    if (loginRequest.userName == UserPassTest.userName &&
        loginRequest.passWord == UserPassTest.passWord) {
      navigateSuccess();
    }
  }

  void changeVal(bool value) {
    // setBusy(true);
    this.rememberPassword = !rememberPassword;
    notifyListeners();
    // setBusy(false);
  }

  void changeValEver(bool value) {
    // setBusy(true);
    this.keepLoggedIn = !keepLoggedIn;
    notifyListeners();
    // setBusy(false);
  }
}
