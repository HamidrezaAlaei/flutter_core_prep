import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamidreza_test_march8/ui/screens/users_screen/users_view_model.dart';
import 'package:hamidreza_test_march8/ui/widgets/static/user_card.dart';
import 'package:stacked/stacked.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersViewModel>.reactive(
        //arrow function, returning an instance of the viewModel.
        viewModelBuilder: () =>
            UsersViewModel(), // connected user_view to user_view model
        //arrow function expecting the model as its argument when it has just mounted.
        onModelReady: (model) => model.onModelReady(),
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(child: UsersBodyView()),
          );
        });
  }
}

class UsersBodyView extends ViewModelWidget<UsersViewModel> {
  @override
  Widget build(BuildContext context, UsersViewModel model) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Users',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 50.0,
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: model.users.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 20.0,
                width: size.width,
              ),
              itemBuilder: (context, index) => UserCard(
                user: model.users[index],
                onClick: () => model.navigateToProducts(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
