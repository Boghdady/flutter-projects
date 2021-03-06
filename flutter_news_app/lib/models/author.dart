class Author {
  String _id;
  String _name;
  String _email;
  String _avatar;

  Author(this._id, this._name, this._email, this._avatar);

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
