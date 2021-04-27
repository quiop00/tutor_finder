import 'package:get_it/get_it.dart';

import 'api_service.dart';
import 'local_storage_service.dart';

GetIt locator=GetIt.instance;
void setupLocator()async{
  locator.registerLazySingleton(() => Api());
  PreferenceUtils.init();
}