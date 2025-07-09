import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const Button({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) {
        return InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(
                  icon,
                  color: theme.isDark ? AppColors.black : AppColors.white,
                  size: 16,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: theme.isDark ? AppColors.black : AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
