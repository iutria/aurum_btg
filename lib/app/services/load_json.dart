import 'dart:convert';

import 'package:flutter/services.dart';

Future<dynamic> loadJson(String file) async {
  final data = await rootBundle.loadString(file);
  return jsonDecode(data);
}
