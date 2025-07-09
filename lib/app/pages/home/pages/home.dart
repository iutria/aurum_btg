import 'package:aurum_btg/app/pages/home/widgets/actions_card.dart';
import 'package:aurum_btg/app/pages/home/widgets/main_card.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  late Key _refreshKey = UniqueKey();
  

  Future<void> _refresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _refreshKey = UniqueKey(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return Scaffold(
            body: RefreshIndicator(
              key: _refreshKey,
              onRefresh: _refresh,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
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
                    UserFundsList(filterByStatus: true,)
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
