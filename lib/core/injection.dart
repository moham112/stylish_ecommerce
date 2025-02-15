import 'package:ecommerce/core/cache_helper.dart';
import 'package:ecommerce/data/services/auth_web_service.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce/logic/auth_cubit.dart';

class Injection {
  static GetIt serviceLocator = GetIt.instance;

  static void injectIt() {
    serviceLocator.resetLazySingleton();
    serviceLocator
        .registerLazySingleton<AuthWebService>(() => AuthWebService());
    if (CacheHelper.read("access_token") != null) {
      serviceLocator.registerLazySingleton(
          () => AuthCubit(serviceLocator<AuthWebService>(), true));
    } else {
      serviceLocator.registerLazySingleton(
          () => AuthCubit(serviceLocator<AuthWebService>(), false));
    }
  }
}
