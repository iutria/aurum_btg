import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/providers/auth_provider.dart';
import 'package:aurum_btg/app/routes/routes.dart';
import 'package:aurum_btg/app/theme/theme.dart';
import 'package:aurum_btg/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  _navigate(context, route){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(
        context,
        route,
      );
    });
  }

  _onSuccess(BuildContext context)=> _navigate(context, Routes.home);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          decoration: BoxDecoration(),
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) {
              return FutureBuilder(
                future: Future.delayed(
                  const Duration(seconds: 3),
                  () => auth.loadUser(),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Message(image: PngAssets.error, message: snapshot.error.toString().split(':')[1].trim(), color: AppColors.white),
                    );
                  }

                  if (snapshot.hasData) {
                    _onSuccess(context);
                  }

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Image.asset(
                          PngAssets.iconWhite,
                          fit: BoxFit.cover,
                          width: 50,
                        ),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
