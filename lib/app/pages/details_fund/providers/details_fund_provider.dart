import 'package:aurum_btg/app/config/hive/hive_settings.dart';
import 'package:aurum_btg/app/models/fund.dart';
import 'package:aurum_btg/app/models/user_fund.dart';
import 'package:aurum_btg/app/pages/details_fund/services/details_fund_service.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailsFundProvider extends ChangeNotifier {
  late String notificationMethod = '';

  final AuthProvider authProvider;

  DetailsFundProvider(this.authProvider);

  selectNotificationMethod(String? value) {
    notificationMethod = value ?? '';
    notifyListeners();
  }

  Future<void> subscribe(
    context,
    Fund fund,
    Function(BuildContext, bool, String) onFinish,
  ) async {
    if (notificationMethod.isEmpty) {
      onFinish(context, false, 'Debe seleccionar un método de notificación');
      return;
    }

    try {
      if ((HiveSettings.amount ?? 0) < fund.price!) {
        onFinish(context, false, 'No tienes saldo suficiente');
        return;
      }
      final date = DateTime.now();
      final userFund = UserFund.fromFund(
        fund.toJson(),
        notificationMethod,
        date,
      );

      final amount = HiveSettings.amount! - fund.price!;
      await DetailsFundService.save(userFund);
      HiveSettings.amount = amount;
      selectNotificationMethod('');
      authProvider.changeAmount(amount);

      onFinish(context, true, 'Se realizó correctamente la suscripción');
    } on DioException catch (e) {
      onFinish(
        context,
        false,
        e.message ?? 'Ocurrió un error al realizar la suscripción',
      );
    } catch (e) {
      onFinish(context, false, 'Ocurrió un error al realizar la suscripción');
    }
  }
}
