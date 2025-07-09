
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../utils/utils.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.isDark ? AppColors.grey : AppColors.secondaryWhite,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: 'Buscar',
              hintStyle: TextStyle(color: theme.isDark ? AppColors.secondaryWhite : AppColors.oceanBlue ),
              iconColor: theme.isDark ? AppColors.secondaryWhite : AppColors.oceanBlue ,
              prefixIconColor: theme.isDark ? AppColors.secondaryWhite : AppColors.oceanBlue ,
              suffixIconColor: theme.isDark ? AppColors.secondaryWhite : AppColors.oceanBlue ,
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(BootstrapIcons.chevron_left, size: 16,),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(BootstrapIcons.filter,),
                  ),
                ],
              ),
              border: buildOutlineBorder(),
              focusedBorder: buildOutlineBorder(),
              enabledBorder: buildOutlineBorder(),
            ),
          ),
        );
      }
    );
  }
}
