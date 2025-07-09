import 'package:aurum_btg/app/pages/details_fund/providers/details_fund_provider.dart';
import 'package:aurum_btg/app/models/fund.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:aurum_btg/app/utils/utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';

class DetailsFund extends StatelessWidget {
  final ValueNotifier<bool> loading = ValueNotifier(false);

  DetailsFund({super.key});

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

  subscribe(context, bool accept, Fund fund) async {
    if (!accept) {
      return;
    }
    loading.value = true;

    await Provider.of<DetailsFundProvider>(
      context,
      listen: false,
    ).subscribe(context, fund, onFinish);

    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Fund;
    return Consumer<AuthProvider>(
      builder:
          (context, auth, child) => ChangeNotifierProvider<DetailsFundProvider>(
            create: (context) => DetailsFundProvider(auth),
            child: Consumer<DetailsFundProvider>(
              builder: (context, fund, _) {
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
                              price: args.price ?? 0,
                              category: args.category ?? '',
                              displayName: args.displayName ?? '',
                              code: args.code ?? '',
                            ),
                          ),
                          Divider(thickness: 3),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Seleccionar método de notificación',
                                style: TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'SMS',
                                    groupValue: fund.notificationMethod,
                                    onChanged:
                                        (value) => fund
                                            .selectNotificationMethod(value),
                                  ),
                                  Expanded(child: Text('SMS')),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'EMAIL',
                                    groupValue: fund.notificationMethod,
                                    onChanged:
                                        (value) => fund
                                            .selectNotificationMethod(value),
                                  ),
                                  Expanded(child: Text('EMAIL')),
                                ],
                              ),
                            ],
                          ),
                          Button(
                            loading: loading,
                            color: AppColors.success,
                            title: 'Suscribirme',
                            onTap: () {
                              alert(
                                context,
                                text: '¿Quieres suscribirte a este fondo?',
                                title: 'Suscribirse',
                                action:
                                    (value) => subscribe(context, value, args),
                              );
                            },
                            icon: BootstrapIcons.hand_index,
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
}
