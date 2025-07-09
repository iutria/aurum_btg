import 'package:hive_flutter/adapters.dart';
import 'hive_settings.dart';

initHiveBox() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveSettings.name);
}
