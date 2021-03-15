import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamidreza_test_march8/core/model/request/login_request/login_request.dart';
import 'package:hamidreza_test_march8/ui/widgets/static/logo_box_decor.dart';
import 'package:hamidreza_test_march8/ui/widgets/static/text_form_field.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.deepPurple,
          appBar: createAppBar(model),
          body: SafeArea(
            child: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: model.loginKey,
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: DecoratedImageBoxLogo(),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: TextFromField(
                                name: LoggedUserNames.userName,
                                hintText: 'User Name',
                                fieldInitialValue: model.getUserName(),
                                onSaved: model.saveForm,
                                validator: model.validateUserName,
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: TextFromField(
                                name: LoggedUserNames.passWord,
                                hintText: 'Pass word',
                                fieldInitialValue: model.getPassWord(),
                                onSaved: model.saveForm,
                                validator: model.validatePassWord,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: CheckboxListTile(
                                title: Text('Save my password'),
                                controlAffinity:
                                    ListTileControlAffinity.platform,
                                value: model.getRememebrPass(),
                                onChanged: (value) =>
                                    model.setRememberPass(value),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: CheckboxListTile(
                                title: Text('Keep me logged in'),
                                controlAffinity:
                                    ListTileControlAffinity.platform,
                                value: model.getKeepLogedIn(),
                                onChanged: (value) =>
                                    model.setKeepLoggedIn(value),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: model.validateForm,
                                child: Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //login username
                      //login password
                    ),
                  ),
          ),
        );
      },
    );
  }

  createAppBar(LoginViewModel model) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      bottomOpacity: 0,
      backwardsCompatibility: true,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.orange), //appbat
      brightness: Brightness.dark,
    );
  }
}
