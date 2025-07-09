import 'package:hive_flutter/adapters.dart';

abstract class HiveSettings {
  static const String name = 'Settings';

  static Box<dynamic> get _box => Hive.box(name);

  static bool? get isDark => _box.get('isDark');
  static set isDark(bool? value) => _box.put('isDark', value);

  static Future<void> clear()async => await _box.clear();
}
