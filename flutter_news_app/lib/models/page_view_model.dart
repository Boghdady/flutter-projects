import 'package:flutter/material.dart';

class PageViewModel {
  String _title;
  String _description;
  IconData _icon;

  PageViewModel(this._title, this._description, this._icon);

  IconData get icon => _icon;

  String get description => _description;

  String get title => _title;
}
