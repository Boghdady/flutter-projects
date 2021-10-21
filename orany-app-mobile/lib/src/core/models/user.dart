import 'package:orany_app/src/core/utils/exceptions.dart';

class User {
  String role;
  String name;
  String email;
  String id;

  User({this.role, this.name, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {
    // assert is useful for debugging, not work on production
    assert(json['id'] != null, 'User ID is null');
    assert(json['email'] != null, 'User email is null');
    assert(json['name'] != null, 'User name is null');

    id = (json['id'] == null)
        ? throw PropertyIsRequiredException('UserId')
        : json['id'];
    role = json['role'];
    name = (json['name'] == null)
        ? throw PropertyIsRequiredException('User name')
        : json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
