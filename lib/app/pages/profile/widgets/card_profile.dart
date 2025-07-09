
import 'package:aurum_btg/app/providers/theme_provider.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProfile extends StatelessWidget {
  final String title;
  final String value;

  const CardProfile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Consumer<ThemeProvider>(
          builder: (context, theme, _) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    theme.isLight ? AppColors.secondaryWhite : AppColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                value,
                style: TextStyle(
                  color: theme.isLight ? AppColors.black : AppColors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
