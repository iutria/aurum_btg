import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';
import '../providers/funds_provider.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

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
              body: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text('Movimientos', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                    UserFundsList(
                      useColors: true,
                    )
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
