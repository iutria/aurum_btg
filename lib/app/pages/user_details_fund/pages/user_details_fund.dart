import 'package:aurum_btg/app/models/models.dart';
import 'package:aurum_btg/app/providers/auth_provider.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:aurum_btg/app/utils/alerts.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';
import '../provider/user_details_provider.dart';

class UserDetailsFund extends StatelessWidget {
  UserDetailsFund({super.key});

  final ValueNotifier<bool> loading = ValueNotifier(false);

  onFinish(context, status, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: status ? AppColors.success : AppColors.error,
        content: Text(message),
        showCloseIcon: true,
        duration: Duration(seconds: 5),
        closeIconColor: AppColors.white,
      ),
    );
  }

  subscribe(context, bool accept) async {
    if (!accept) {
      return;
    }
    
    loading.value = true;

    await Provider.of<UserDetailsFundProvider>(
      context,
      listen: false,
    ).cancelSubscription(context, onFinish);

    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as UserFund;
    return Consumer<AuthProvider>(
      builder:
          (
            context,
            auth,
            child,
          ) => ChangeNotifierProvider<UserDetailsFundProvider>(
            create: (context) => UserDetailsFundProvider(args, auth),
            child: Consumer<UserDetailsFundProvider>(
              builder: (context, userFund, _) {
                return SafeArea(
                  child: Scaffold(
                    appBar: AppBar(),
                    body: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FundDetails(
                              price: userFund.userFund?.price ?? 0,
                              category: userFund.userFund?.category ?? '',
                              displayName: userFund.userFund?.displayName ?? '',
                              code: userFund.userFund?.code ?? '',
                            ),
                          ),
                          Divider(endIndent: 2),
                          detail(
                            'Estado: ',
                            userFund.userFund!.status == true
                                ? 'Activo'
                                : 'Inactivo',
                          ),
                          detail(
                            'Fecha de suscripción: ',
                            formatDate(
                              userFund.userFund!.subscriptionDate.toString(),
                            ),
                          ),
                          if (userFund.userFund!.status != true)
                            detail(
                              'Fecha de Cancelación: ',
                              formatDate(
                                userFund.userFund!.subscriptionDate.toString(),
                              ),
                            ),
                          detail(
                            'Tipo de notificación: ',
                            userFund.userFund!.notificationType ?? '',
                          ),
                          if (userFund.userFund!.status == true)
                            Button(
                              onTap: () {
                                alert(
                                  context,
                                  text:
                                      '¿Quieres cancelar la suscripción a este fondo?',
                                  title: 'Cancelar Suscripción',
                                  action: (value) => subscribe(context, value),
                                );
                              },
                              color: AppColors.error,
                              title: "Cancelar suscripción",
                              icon: BootstrapIcons.x,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
    );
  }

  Text detail(String title, String subtitle) {
    return Text.rich(
      TextSpan(
        text: title,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  formatDate(String value) {
    final DateTime date = DateTime.parse(value).toLocal();
    final String formattedDate = DateFormat('dd/MM/yyyy hh:mm a').format(date);
    return formattedDate;
  }
}
