import 'package:hive/hive.dart';

part 'chached_login_request.g.dart';

@HiveType(typeId: 1)
class CachedLoggedUser extends HiveObject {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String passWord;
  @HiveField(2)
  final bool rememberPass;
  @HiveField(3)
  final bool keepLoggedIn;

  CachedLoggedUser(
      {this.userName, this.passWord, this.rememberPass, this.keepLoggedIn});

  // //operator for assigning the values returned from form to the object fields.
  // void operator []=(String name, dynamic value) {
  //   switch (name) {
  //     case LoggedUserNames.userName:
  //       this.userName = value;
  //       break;
  //     case LoggedUserNames.passWord:
  //       this.passWord = value;
  //       break;
  //     default:
  //       return;
  //   }
  // }
}
