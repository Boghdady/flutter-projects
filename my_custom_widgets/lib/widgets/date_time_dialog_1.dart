import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class DateTimeDialog1 {
  static final PickerData2 = '''
[
    [
        1,
        2,
        3,
        4,
        5
    ],
    [
        11,
        22,
        33,
        44
    ],
    [
        "aaa",
        "bbb",
        "ccc"
    ]
]
    ''';

  static showPickerArray(BuildContext context) {
    new Picker(
        selecteds: [2, 2, 2],
        confirmText: 'موافق',
        cancelText: 'الغاء',
        itemExtent: 60,
        height: 120,
        adapter: PickerDataAdapter<String>(
          pickerdata: new JsonDecoder().convert(PickerData2),
          isArray: true,
        ),
        columnPadding: EdgeInsets.only(left: 10),
        hideHeader: true,
        title: Align(
          child: Text("اختر تاريخ ميلادك"),
          alignment: Alignment.topRight,
        ),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }
}
