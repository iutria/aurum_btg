import 'package:aurum_btg/app/pages/pages.dart';
import 'package:aurum_btg/app/routes/routes.dart';
import 'package:aurum_btg/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Aurum BTG',
          themeMode: themeProvider.theme,
          theme: lightTheme,
          darkTheme: darkTheme,
          color: AppColors.primary,
          debugShowCheckedModeBanner: false,
          routes: Pages.allPages,
          initialRoute: Routes.splashScreen,
          onUnknownRoute:
              (settings) =>
                  MaterialPageRoute(builder: (context) => ErrorPage()),
        );
      },
    );
  }
}
