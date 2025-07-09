import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/routes/app_routes.dart';
import 'package:aurum_btg/app/theme/theme.dart';
import 'package:aurum_btg/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';
import '../providers/funds_provider.dart';

class Funds extends StatelessWidget {
  const Funds({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FundsProvider>(
      create: (context) => FundsProvider(),
      child: Consumer<FundsProvider>(
        builder: (context, funds, _) {
          return SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Input(),
                ),
              ),
              body:
                  funds.isLoading
                      ? Center(
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                      : funds.isError
                      ? Center(
                        child: Message(
                          image: PngAssets.error,
                          message: funds.errorMessage,
                          color: AppColors.error,
                        ),
                      )
                      : funds.funds.isEmpty
                      ? Center(
                        child: Message(
                          image: PngAssets.empty,
                          message: 'No se encontraron fondos',
                          color: AppColors.grey,
                        ),
                      )
                      : SingleChildScrollView(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Column(
                              spacing: 5,
                              children: List.generate(
                                funds.funds.length,
                                (index) => CustomCard(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.detailsFund,
                                      arguments: funds.funds[index],
                                    );
                                  },
                                  title: funds.funds[index].displayName ?? '',
                                  subtitle: funds.funds[index].code ?? '',
                                  amount:
                                      '\$${formatCOP.format(funds.funds[index].price ?? 0)}',
                                  label: funds.funds[index].category ?? '',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
          );
        },
      ),
    );
  }
}
