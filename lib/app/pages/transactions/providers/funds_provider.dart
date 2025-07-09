import 'package:aurum_btg/app/config/assets/json.dart';
import 'package:aurum_btg/app/pages/funds/models/fund.dart';
import 'package:aurum_btg/app/services/services.dart';
import 'package:flutter/material.dart';

class FundsProvider extends ChangeNotifier {
  late bool isLoading = false;
  late bool isError = false;
  late String errorMessage = '';
  late List<Fund> funds = [];

  FundsProvider() {
    loadFunds();
  }

  Future<void> loadFunds() async {
    isLoading = true;
    notifyListeners();
    try {
      final funds = await loadJson(JsonAssets.funds);
      await Future.delayed(const Duration(seconds: 3));
      this.funds =
          (funds as List)
              .map((e) => Fund.fromJson(e as Map<String, dynamic>))
              .toList();
    } catch (e) {
      isError = true;
      errorMessage = e.toString().split(':')[1].trim();
    }
    isLoading = false;
    notifyListeners();
  }
}
