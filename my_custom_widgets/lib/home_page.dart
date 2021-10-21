import 'package:flutter/material.dart';
import 'package:my_custom_widgets/widgets/date_time_dialog_1.dart';
import 'package:my_custom_widgets/widgets/full_screen_dialog.dart';
import 'package:my_custom_widgets/args/full_screen_dialog_result.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Show Data time dialog -1'),
                onPressed: () {
                  DateTimeDialog1.showPickerArray(context);
                },
              ),
              RaisedButton(
                child: Text('Open fullscreen dialog'),
                onPressed: () {
                  _openFullScreenDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _openFullScreenDialog(BuildContext context) async {
    ///
    /// object result that returned after click save in the fullscreendialog screen
    ///
    Country result =
        await Navigator.of(context).push(new MaterialPageRoute<Country>(
            builder: (BuildContext context) {
              return new FullScreenDialog();
            },
            fullscreenDialog: true));
    if (result != null) {
//      _addWeightSave(save);
//      print(result.dateTime);
//      print(result.random);
      print(result);
    }
  }
}
