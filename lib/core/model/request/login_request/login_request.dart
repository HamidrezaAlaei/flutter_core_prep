class LoggedUserNames {
  static const String userName = 'userName';
  static const String passWord = 'passWord';
}

class LoginRequest {
  String userName;

  String passWord;

  LoginRequest({this.userName, this.passWord});

  //operator for assigning the values returned from form to the object fields.
  void operator []=(String name, dynamic value) {
    switch (name) {
      case LoggedUserNames.userName:
        this.userName = value;
        break;
      case LoggedUserNames.passWord:
        this.passWord = value;
        break;
      default:
        return;
    }
  }
}
