import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_custom_widgets/args/full_screen_dialog_result.dart';

enum Country {
  Egypt,
  Oman,
  SuadiArab,
}

class FullScreenDialog extends StatefulWidget {
  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
// ...

  Country _country = Country.Egypt;
  bool _isEgyptSelected = false;
  bool _isOmanSelected = false;
  bool _isKsaSelected = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('New entry'),
        actions: [
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(_country);
            },
            child: new Text('SAVE'),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: _isEgyptSelected,
              title: const Text('مصر'),
              onChanged: (bool value) {
                setState(() {
                  _isEgyptSelected = value;
                });
              },
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: CheckboxListTile(
              value: _isOmanSelected,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('عمان'),
              onChanged: (bool value) {
                setState(() {
                  _isOmanSelected = value;
                });
              },
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: CheckboxListTile(
              value: _isKsaSelected,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('السعودية'),
              onChanged: (bool value) {
                setState(() {
                  _isKsaSelected = value;
                });
              },
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
          RadioListTile<Country>(
            title: const Text('Oman'),
            value: Country.Oman,
            groupValue: _country,
            onChanged: (Country value) {
              setState(() {
                _country = value;
              });
            },
          ),
          RadioListTile<Country>(
            title: const Text('Egypt'),
            value: Country.Egypt,
            groupValue: _country,
            onChanged: (Country value) {
              setState(() {
                _country = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
