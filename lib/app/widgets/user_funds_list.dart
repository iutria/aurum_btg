import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/models/models.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:aurum_btg/app/utils/utils.dart';
import 'package:aurum_btg/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../services/funds_user_service.dart';

class UserFundsList extends StatelessWidget {
  final bool? filterByStatus;
  final bool? useColors;
  const UserFundsList({super.key, this.filterByStatus = false, this.useColors});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserFund>>(
      future: FundsUserService.get(filterByStatus),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 200,
            child: Center(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                    Text('Cargando...'),
                  ],
                ),
              ),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Consumer<ThemeProvider>(
            builder:
                (context, theme, child) => Column(
                  spacing: 5,
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => CustomCard(
                      color:
                          (useColors != null && useColors!)
                              ? (theme.isDark
                                  ? AppColors.grey
                                  : AppColors.secondaryWhite)
                              : null,
                      textColor:
                          (useColors != null && useColors!)
                              ? (theme.isDark
                                  ? AppColors.secondaryWhite
                                  : AppColors.oceanBlue)
                              : null,
                      emphasisColor:
                          (useColors != null && useColors!)
                              ? (snapshot.data![index].status == true
                                  ? AppColors.success
                                  : AppColors.error)
                              : null,
                      amount:
                          '\$${formatCOP.format(snapshot.data![index].price)}',
                      label: snapshot.data![index].category ?? '',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.userDetailsFund,
                          arguments: snapshot.data![index],
                        );
                      },
                      subtitle: snapshot.data![index].code ?? '',
                      title: snapshot.data![index].displayName ?? '',
                    ),
                  ),
                ),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: 50),
          child: Center(
            child: Message(
              image: snapshot.hasError ? PngAssets.error : PngAssets.empty,
              message:
                  snapshot.hasError
                      ? (snapshot.error.toString())
                      : 'No tienes Fondos activos',
              color: AppColors.oceanBlue,
            ),
          ),
        );
      },
    );
  }
}
