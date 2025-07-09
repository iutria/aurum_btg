import 'package:aurum_btg/app/pages/home/widgets/actions_card.dart';
import 'package:aurum_btg/app/pages/home/widgets/main_card.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  MainCard(user: auth.user),
                  ActionsCard(),
                  Text(
                    'Mis Fondos',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24),
                  ),
                  for(int i = 0; i < 20; i++)
                  CustomCard(
                    amount: '\$10.000',
                    label: 'FPV',
                    onTap: () {
                      print('Card tapped');
                    },
                    subtitle: 'FPV BTG Pactual Recaudadora',
                    title: 'FPV BTG Pactual Recaudadora',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
