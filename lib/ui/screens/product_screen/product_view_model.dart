import 'package:hamidreza_test_march8/core/model/responses/product.dart';
import 'package:hamidreza_test_march8/core/model/responses/user.dart';
import 'package:hamidreza_test_march8/core/services/functional_services/api.dart';
import 'package:hamidreza_test_march8/shared/locator/locator.dart';
import 'package:hamidreza_test_march8/shared/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductViewModel extends BaseViewModel {
  //instantiating the singleton of the core class.
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  final User selectedUser;
  List<Product> products = [];

  ProductViewModel(this.selectedUser);

  void onModelReady() {
    _getProductsList();
  }

  Future<void> _getProductsList() async {
    setBusy(true);
    List<Product> productList = await _api.getProducts();
    products.addAll(productList);
    //notifyListeners();
    setBusy(false); //already has the notify listener
  }

  //function for navigation
  void navigateBack() {
    _navigationService.popRepeated(1);
  }

  void navigateToForm(User user) async {
    //navigation for keeping the thread and waiting for result
    final User result = await _navigationService.navigateTo(Routes.formView,
        arguments: FormViewArguments(selectedUser: user));
    print(result.toJson());
    notifyListeners();
  }
}
