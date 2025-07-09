import 'package:aurum_btg/app/theme/theme.dart';
import 'package:flutter/material.dart';

alert(
  context, {
  required String title,
  required String text,
  Function(bool)? action,
}) => showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: Text(text),
      actions: [
        TextButton(
          child: Text('Cancelar', style: TextStyle(color: AppColors.error)),
          onPressed: () {
            Navigator.of(context).pop();

            if (action != null) {
              action(false);
            }
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.success),
          ),
          child: Text('Aceptar'),
          onPressed: () {
            Navigator.of(context).pop();
            if (action != null) {
              action(true);
            }
          },
        ),
      ],
    );
  },
);
