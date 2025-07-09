import 'package:aurum_btg/app/pages/funds/models/fund.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:aurum_btg/app/utils/utils.dart';
import 'package:aurum_btg/app/widgets/button.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class DetailsFund extends StatelessWidget {
  DetailsFund({super.key});


  String selectedCategory = 'FPV';


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Fund;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          '\$${formatCOP.format(args.price ?? 0)}',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          args.category ?? 'No Category',
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
                  args.displayName ?? 'No Name',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(args.code ?? 'No Name', style: TextStyle(fontSize: 12)),
                Column(
                  children: [
                    Radio<String>(
                      // title: Text('FPV'),
                      
                      value: 'FPV',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        
                      },
                    ),
                    Radio<String>(
                      // title: Text('FIC'),
                      value: 'FIC',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        
                      },
                    ),
                  ],
                ),
                Button(
                  color: AppColors.success,
                  title: 'Suscribirme',
                  icon: BootstrapIcons.hand_index,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
