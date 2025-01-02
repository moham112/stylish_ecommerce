import 'package:ecommerce/data/services/auth_web_service.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce/logic/auth_cubit.dart';

class Injection {
  static GetIt serviceLocator = GetIt.instance;

  static void injectIt() {
    serviceLocator.resetLazySingleton();
    serviceLocator.registerLazySingleton<AuthWebService>(() => AuthWebService());
    serviceLocator.registerLazySingleton(() => AuthCubit(serviceLocator<AuthWebService>()));
  }
}
