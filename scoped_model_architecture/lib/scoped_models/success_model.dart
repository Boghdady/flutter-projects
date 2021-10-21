import 'package:scoped_model_architecture/enums/view_states.dart';

import 'base_model.dart';

class SuccessModel extends BaseModel {
  String title = "no text yet";

  // function to duplicate the text
  Future fetchDuplicatedText(String text) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 2));
    title = "$text $text";
    setState(ViewState.Retrieved);
  }
}
