import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

class UserPreferences {
  static SharedPreferences get _preferences =>
      injector.get<SharedPreferences>();

  static String get reports => _preferences.getString('reports') ?? '';
  static set reports(String reports) =>
      _preferences.setString('reports', reports);
}
