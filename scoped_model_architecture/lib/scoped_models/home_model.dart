import 'package:scoped_model_architecture/enums/view_states.dart';
import 'package:scoped_model_architecture/services/storage_service.dart';

import '../service_locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();

  String title = "HomeModel1";

  Future<bool> saveData() async {
    setState(ViewState.Busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data Saving";
    setState(ViewState.Retrieved);
    return true;
  }
}
