import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/core/model/constants/hive_names.dart';
import 'package:hamidreza_test_march8/core/model/constants/user_pass_test.dart';
import 'package:hamidreza_test_march8/core/model/request/login_request/chached_login_request.dart';
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

  ///material needed for the login fields to be generated.
  LoginRequest loginRequest = LoginRequest();
  bool rememberPassword = false;
  bool keepLoggedIn = false;

  ///cashed logged user initialized
  CachedLoggedUser cachedLoggedUser;

  onModelReady() async {
    //TODO: get the inforamtion from cache and set the keepLoggedIN and rememberPassword
    checkStatusLogin();
  }

  ///cache logged user
  ///
  ///
  ///
  Future<void> cacheLoggedUser1(CachedLoggedUser cachedLoggedUser) async {
    _hiveService.cache(
        cachedLoggedUser, HiveConst.boxName, HiveConst.loggedUser);
    cachedLoggedUser.save();
  }

  ///function for fetching the logged user data
  ///
  /// returns the user object
  Future<CachedLoggedUser> releaseLoggedUser() async {
    return _hiveService.retrieve(HiveConst.boxName, HiveConst.loggedUser);
  }

  /// function for checking the situation of login
  /// if the object of the user are existing: check data with accepted password
  /// if they are in sync:
  /// if the data are fetched and the booleans have value: check if the keep me logged in is true:
  /// if it is true, login to the system,
  /// if the keep me logged in is false , check if remember password is true:
  /// if it is true, set the values as the initial values and navigate to the login page.
  /// if the user is fetched from the hive and values are set to false:
  /// ask the user for username and password.
  ///
  ///
  void checkStatusLogin() async {
    setBusy(true);
    cachedLoggedUser = await releaseLoggedUser();
    print(cachedLoggedUser.userName);
    if (cachedLoggedUser == null) {
      cachedLoggedUser = CachedLoggedUser(
          userName: "", passWord: "", rememberPass: false, keepLoggedIn: false);

      ///sample code syntax review.
      // var test = CachedLoggedUser()
      //   ..rememberPass = true
      //   ..keepLoggedIn = false
      //   ..userName = '2';

      cacheLoggedUser1(cachedLoggedUser);
      setBusy(false);
      return;
    }
    setBusy(false);
    if (cachedLoggedUser.keepLoggedIn == true &&
        cachedLoggedUser.passWord == UserPassTest.passWord) {
      // navigate to next page.
      navigateSuccess();
    } else if (cachedLoggedUser.rememberPass == true &&
        cachedLoggedUser.passWord == UserPassTest.passWord) {
      setRememberPass(true);
      setKeepLoggedIn(false);
      notifyListeners();

      return;
    } else {
      //login same as before.

    }
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
  }

  //checking to see if data read from user is correct.
  void _validateResults() {
    if (loginRequest.userName == UserPassTest.userName &&
        loginRequest.passWord == UserPassTest.passWord) {
      cachedLoggedUser.userName = loginRequest.userName;
      cachedLoggedUser.passWord = loginRequest.passWord;
      cachedLoggedUser.keepLoggedIn = getKeepLogedIn();
      cachedLoggedUser.rememberPass = getRememebrPass();
      _hiveService.boxUpdate(HiveConst.boxName, cachedLoggedUser);
      navigateSuccess();
    }
  }

  ///gets the cached [userName] from the object instantiated with the hive method.
  ///
  /// returns String of [cachedLoggedUser] username
  String getUserName() {
    return cachedLoggedUser.userName;
  }

  ///gets the cached [passWord] from the object instantiated with the hive method.
  ///
  /// returns String of [cachedLoggedUser] password.
  String getPassWord() {
    return cachedLoggedUser.passWord;
  }

  ///gets a boolean [val] and sets it to the class rememebrPassword value.
  void setRememberPass(bool val) {
    this.rememberPassword = val;
    notifyListeners();
  }

  ///gets a boolean [val] and sets it to the class keepLoggedIn value.
  void setKeepLoggedIn(bool val) {
    this.keepLoggedIn = val;
    notifyListeners();
  }

  ///gets the boolean value for the remember password
  bool getRememebrPass() {
    return rememberPassword;
  }

  ///gets the boolean value for the keep me logged in.
  bool getKeepLogedIn() {
    return keepLoggedIn;
  }
}
