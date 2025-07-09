import 'package:aurum_btg/app/config/hive/hive_settings.dart';
import 'package:aurum_btg/app/models/models.dart';
import 'package:aurum_btg/app/pages/user_details_fund/services/user_details_fund_service.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:flutter/material.dart';

class UserDetailsFundProvider extends ChangeNotifier {
  UserFund? userFund;

  final AuthProvider authProvider;

  UserDetailsFundProvider(UserFund this.userFund, this.authProvider);

  cancelSubscription(
    context,
    Function(BuildContext, bool, String) onFinish,
  ) async {
    try {
      final editUser = userFund;
      editUser!.status = false;
      await UserDetailsFundService.put(editUser);
      userFund = editUser;
      final amount = HiveSettings.amount! + editUser.price!;
      HiveSettings.amount = amount;
      authProvider.changeAmount(amount);

      onFinish(context, true, 'Suscripción cancelada correctamente');

    } catch (e) {
      onFinish(context, false, 'Ha ocurrido un error al cancelar la suscripción');
    }
  }
}
