class Category {
  String _id;
  String _title;

  Category(this._id, this._title);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
