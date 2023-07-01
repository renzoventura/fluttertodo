import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  SharedPreferences instance = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferencesService>(
      SharedPreferencesService(instance));
}

class SharedPreferencesService {
  SharedPreferencesService(this._preferences);
  final SharedPreferences _preferences;

  bool isSplashScreenSkipped() =>
      _preferences.getBool(splashScreenSkipped) ?? false;

  void setIsSplashScreenSkipped(bool value) =>
      _preferences.setBool(splashScreenSkipped, value);

  static const String splashScreenSkipped = "SPLASH_SCREEN_SKIPPED";
}
