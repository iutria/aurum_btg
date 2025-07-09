import 'package:aurum_btg/app/models/models.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/theme/theme.dart';
import 'package:aurum_btg/app/utils/utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainCard extends StatelessWidget {
  final User user;

  const MainCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Text(
                      'Hola, ${user.name ?? ''}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.isLight ? Colors.white : Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Icon(BootstrapIcons.person_circle, color: theme.isDark ? AppColors.black: AppColors.white,),
                ],
              ),
              Text(
                'Disponible',
                style: TextStyle(
                  color: theme.isLight ? Colors.white : Colors.black,
                  fontSize: 12,
                ),
              ),
              Tooltip(
                message: '\$${formatCOP.format(user.amount ?? 0)}',
                child: Text(
                  '\$${formatCOP.format(user.amount ?? 0)}',
                  style: TextStyle(
                    color: theme.isLight ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
