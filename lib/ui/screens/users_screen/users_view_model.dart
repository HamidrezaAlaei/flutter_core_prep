import 'package:hamidreza_test_march8/core/model/responses/user.dart';
import 'package:hamidreza_test_march8/core/services/functional_services/api.dart';
import 'package:hamidreza_test_march8/shared/locator/locator.dart';
import 'package:hamidreza_test_march8/shared/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends BaseViewModel {
  //instantiating the singleton of the core class.
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  List<User> users = [];

  void onModelReady() {
    _getUsersList();
  }

  Future<void> _getUsersList() async {
    setBusy(true);
    List<User> userList = await _api.getUsers();
    users.addAll(userList);
    //notifyListeners();
    setBusy(false); //already has the notify listener
  }

  navigateToProducts(int index) async {
    final User user = users[index];
    await _navigationService.navigateTo(Routes.productView,
        arguments: ProductViewArguments(selectedUser: user));
    notifyListeners();
  }
}
