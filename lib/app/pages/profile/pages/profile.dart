import 'package:aurum_btg/app/providers/auth_provider.dart';
import 'package:aurum_btg/app/theme/theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
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
                  Center(child: Icon(BootstrapIcons.person_circle, size: 150)),
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
      }
    );
  }
}

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
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.secondaryWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value),
        ),
      ],
    );
  }
}
