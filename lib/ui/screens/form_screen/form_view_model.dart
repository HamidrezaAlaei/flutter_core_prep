import 'package:flutter/cupertino.dart';
import 'package:hamidreza_test_march8/core/model/responses/user.dart';
import 'package:hamidreza_test_march8/core/services/functional_services/api.dart';
import 'package:hamidreza_test_march8/shared/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FormviewModel extends BaseViewModel {
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  final GlobalKey<FormState> formKey = GlobalKey();
  Map<String, dynamic> formValues = Map();
  final User user;

  FormviewModel({this.user});

  //function for navigation
  void navigateBack() {
    _navigationService.back(result: user);
  }

  //function for validation of each field in the form.
  String validateFirst(String text) {
    if (text != null && text.length > 0) {
      return null;
    } else
      return "Should not be empty";
  }

  //function for getting the data and assigning it to the object values.
  void saveForm<T>(String name, T value) {
    formValues[name] = value;
    user[name] = value;
    print(name);
    print(user.toJson());
  }

  void validateForm() {
    final validated = formKey.currentState.validate();
    if (!validated) return;
    formKey.currentState.save();
    // use for when a dynamic result is expeccted in the previous page
    navigateBack();
  }
}
