import 'package:fluttertodo/services/database_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  SharedPreferences instance = await SharedPreferences.getInstance();
  Database db = await initDatabase();

  getIt.registerSingleton<SharedPreferencesService>(
      SharedPreferencesService(instance));
  getIt.registerSingleton<DatabaseHelper>(DatabaseHelper(db));
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

Future<Database> initDatabase() async {
  final path = await getDatabasesPath();
  final databasePath = join(path, 'todo.db');
  return openDatabase(
    databasePath,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE todos(
            id TEXT PRIMARY KEY,
            title TEXT,
            isCompleted INTEGER
          )
        ''');
    },
  );
}
