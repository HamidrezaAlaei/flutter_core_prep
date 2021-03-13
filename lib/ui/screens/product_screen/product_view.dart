import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamidreza_test_march8/core/model/responses/user.dart';
import 'package:hamidreza_test_march8/ui/screens/product_screen/product_view_model.dart';
import 'package:hamidreza_test_march8/ui/widgets/static/product_card.dart';
import 'package:hamidreza_test_march8/ui/widgets/static/user_card.dart';
import 'package:stacked/stacked.dart';

class ProductView extends StatelessWidget {
  final User selectedUser;

  ProductView({Key key, @required this.selectedUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
      viewModelBuilder: () => ProductViewModel(selectedUser),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: createAppBar(model),
          body: SafeArea(
            child: ProductViewBody(
              passedUser: selectedUser,
            ),
          ),
        );
      },
    );
  }

  createAppBar(ProductViewModel model) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      bottomOpacity: 0,
      backwardsCompatibility: true,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.orange), //appbat
      brightness: Brightness.dark,
      leading: BackButton(
        color: Colors.black,
        onPressed: model.navigateBack,
      ),
    );
  }
}

class ProductViewBody extends ViewModelWidget<ProductViewModel> {
  final User passedUser;
  ProductViewBody({Key key, @required this.passedUser})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, ProductViewModel model) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          GestureDetector(
              onTap: () => model.navigateToForm(passedUser),
              child: UserCard(user: passedUser)),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: model.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) =>
                    ProductCard(product: model.products[index])),
          )
        ],
      ),
    );
  }
}

//GridView.count(
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 8.0,
//               children: List.generate(model.products.length,
//                   (index) => ProductCard(product: model.products[index])),
//             ),

// ListView.separated(
// itemBuilder: (context, index) =>
// ProductCard(product: model.products[index]),
// separatorBuilder: (context, index) => VerticalDivider(),
// itemCount: model.products.length),
