import 'package:aurum_btg/app/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../theme/colors.dart';

class ActionsCard extends StatelessWidget {
  ActionsCard({super.key});

  final List<Map<String, dynamic>> _actions = [
    {"title": 'Fondos', "icon": (isDark) => BootstrapIcons.plus, "onTap": (context) {
      Navigator.pushNamed(context, Routes.funds);
    }},
    {
      "title": 'Movimientos',
      "icon": (isDark) => BootstrapIcons.arrow_left_right,
      "onTap": (context) {},
    },
    {
      "title": 'Tema',
      "icon": (isDark) => isDark ? BootstrapIcons.moon : BootstrapIcons.sun,
      "onTap": (context) {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
      
    },
    {"title": 'Perfil', "icon": (isDark) => BootstrapIcons.person, "onTap": (context) {
      Navigator.pushNamed(context, Routes.profile);
    }},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) {
        return Container(
          decoration: BoxDecoration(
            color: theme.isDark ? AppColors.grey : AppColors.secondaryWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _actions.length,
              (index) => Column(
                spacing: 5,
                children: [
                  InkWell(
                    onTap: () => _actions[index]['onTap'](context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.isDark ? AppColors.white : AppColors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        _actions[index]['icon'](theme.isDark),
                        size: 16,
                        color: theme.isDark ? AppColors.black : AppColors.white,
                      ),
                    ),
                  ),
                  Text(_actions[index]['title'], style: TextStyle(fontSize: 8)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
