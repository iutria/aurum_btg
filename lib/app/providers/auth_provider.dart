import 'package:aurum_btg/app/config/assets/json.dart';
import 'package:aurum_btg/app/config/hive/hive_settings.dart';
import 'package:aurum_btg/app/models/models.dart';
import 'package:aurum_btg/app/services/services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User user = User();

  loadUser() async {
    try {
      final Map<String, dynamic> userResponse = await loadJson(JsonAssets.user);
      user = User.fromJson(userResponse);
      HiveSettings.amount = HiveSettings.amount ?? user.amount;
      user.amount = HiveSettings.amount;
      return true;
    } catch (e) {
      throw Exception(
        'Ups... \nHa ocurrido un error al cargar los datos del usuario',
      );
    }
  }

  changeAmount(int value){
    user = user.copyWith(amount: value);
    notifyListeners();
  }
}
