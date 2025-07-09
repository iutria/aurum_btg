import 'package:aurum_btg/app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String? date;
  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final Color? emphasisColor;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.date,
    required this.label,
    this.onTap,
    this.color,
    this.textColor,
    this.emphasisColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return Container(
            decoration: BoxDecoration(
              color: color ?? AppColors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              spacing: 10,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: theme.isLight ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 8,
                        color: emphasisColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color:
                              textColor ??
                              (theme.isLight
                                  ? AppColors.white
                                  : AppColors.black),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 8,
                          color:
                              textColor ??
                              (theme.isLight
                                  ? AppColors.white
                                  : AppColors.black),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            emphasisColor ??
                            (theme.isDark ? AppColors.black : AppColors.white),
                      ),
                    ),
                    if (date != null)
                      Text(
                        date!,
                        style: TextStyle(
                          fontSize: 10,
                          color:
                              (theme.isDark
                                  ? AppColors.grey
                                  : AppColors.secondaryWhite),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
