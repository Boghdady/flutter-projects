import 'package:get_it/get_it.dart';
import 'package:scoped_model_architecture/scoped_models/error_model.dart';
import 'package:scoped_model_architecture/scoped_models/home_model.dart';
import 'package:scoped_model_architecture/scoped_models/success_model.dart';
import 'package:scoped_model_architecture/services/storage_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register Services
  locator.registerLazySingleton<StorageService>(() => StorageService());
  // Register Models
  locator.registerFactory<HomeModel>(() => HomeModel());
  locator.registerFactory<ErrorModel>(() => ErrorModel());
  locator.registerFactory<SuccessModel>(() => SuccessModel());
}
