import 'package:aurum_btg/app/theme/colors.dart';
import 'package:aurum_btg/app/utils/format_currency.dart';
import 'package:flutter/material.dart';

class FundDetails extends StatelessWidget {

  final int price;
  final String category;
  final String displayName;
  final String code;

  const FundDetails({super.key, required this.price, required this.category, required this.displayName, required this.code});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor del fondo',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  '\$${formatCOP.format(price)}',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          displayName,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(code, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
