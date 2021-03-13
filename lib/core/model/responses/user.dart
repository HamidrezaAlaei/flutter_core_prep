import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

class UserFieldNames {
  static const String email = 'email';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String avatarUrl = 'avatarUrl';
}

@JsonSerializable()
class User {
  int id;
  String email;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'avatar')
  String avatarUrl;

  User({this.id, this.email, this.firstName, this.lastName, this.avatarUrl});

  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  //operator on class object for giving features.
  void operator []=(String name, dynamic value) {
    switch (name) {
      case UserFieldNames.firstName:
        this.firstName = value;
        break;
      case UserFieldNames.lastName:
        this.lastName = value;
        break;
      case UserFieldNames.email:
        this.email = value;
        break;
      case UserFieldNames.avatarUrl:
        this.avatarUrl = value;
        break;
      default:
        return;
    }
  }
}
