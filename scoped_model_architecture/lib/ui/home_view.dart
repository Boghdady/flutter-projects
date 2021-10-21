import 'package:flutter/material.dart';
import 'package:scoped_model_architecture/enums/view_states.dart';
import 'package:scoped_model_architecture/scoped_models/home_model.dart';

import 'package:scoped_model_architecture/ui/base_view.dart';
import 'package:scoped_model_architecture/ui/error_view.dart';
import 'package:scoped_model_architecture/ui/success_view.dart';
import 'package:scoped_model_architecture/ui/widgets/busy_overlay.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) => BusyOverlay(
            show: model.state == ViewState.Busy,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  var whereToNavigate = await model.saveData();
                  if (whereToNavigate) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessView("Passed from home"),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ErrorView(),
                        ));
                  }
                },
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Model : HomeModel"),
                    _getBodyUi(model.state),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _getBodyUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
//        return CircularProgressIndicator();
      case ViewState.Retrieved:
        return Text("Done");
      default:
        return Text("default");
    }
  }
}
