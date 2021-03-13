import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamidreza_test_march8/core/model/responses/user.dart';
import 'package:hamidreza_test_march8/ui/screens/form_screen/form_view_model.dart';
import 'package:hamidreza_test_march8/ui/widgets/static/text_form_field.dart';
import 'package:stacked/stacked.dart';

class FormView extends StatelessWidget {
  final User selectedUser;

  FormView({Key key, @required this.selectedUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormviewModel>.reactive(
      viewModelBuilder: () => FormviewModel(user: selectedUser),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: createAppBar(model),
          body: FormViewBody(
              // passedUser: selectedUser,
              ),
        );
      },
    );
  }

  createAppBar(FormviewModel model) {
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

class FormViewBody extends ViewModelWidget<FormviewModel> {
  // final User passedUser;
  FormViewBody({
    Key key,
    // @required this.passedUser,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, FormviewModel model) {
    return Form(
        key: model.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFromField(
                name: UserFieldNames.firstName,
                fieldInitialValue: model.user.firstName,
                validator: model.validateFirst,
                onSaved: model.saveForm,
              ),
              TextFromField(
                name: UserFieldNames.lastName,
                fieldInitialValue: model.user.lastName,
                validator: model.validateFirst,
                onSaved: model.saveForm,
              ),
              TextFromField(
                name: UserFieldNames.email,
                fieldInitialValue: model.user.email,
                validator: (text) => model.validateFirst(text), //example
                onSaved: model.saveForm,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                  onPressed: model.validateForm,
                  child: Text(
                    "CHANGE",
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
