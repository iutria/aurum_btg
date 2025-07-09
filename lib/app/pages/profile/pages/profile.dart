import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/theme/theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/card_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return Consumer<ThemeProvider>(
          builder: (context, theme, _) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(),
                body: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text('Perfil', style: TextStyle(fontSize: 24)),
                      Center(
                        child: Icon(
                          BootstrapIcons.person_circle,
                          size: 150,
                          color:
                              theme.isDark ? AppColors.white : AppColors.black,
                        ),
                      ),
                      CardProfile(
                        title: 'Nombre',
                        value: auth.user.completeName ?? '',
                      ),
                      CardProfile(
                        title: 'Usuario',
                        value: auth.user.username ?? '',
                      ),
                      CardProfile(
                        title: 'Correo',
                        value: auth.user.email ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
