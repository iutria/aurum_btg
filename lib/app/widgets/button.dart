import 'package:aurum_btg/app/providers/providers.dart';
import 'package:aurum_btg/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatefulWidget {
  final Color color;
  final String title;
  final IconData icon;
  final ValueNotifier<bool>? loading;
  final VoidCallback? onTap;

  const Button({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    this.onTap,
    this.loading,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.loading?.addListener(_loading);
  }

  _loading() {
    if (widget.loading != null) {
      setState(() {
        loading = widget.loading!.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) {
        return InkWell(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.color,
            ),
            padding: EdgeInsets.all(10),
            child:
                loading
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                        Text('Cargando...'),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(
                          widget.icon,
                          color:
                              theme.isDark ? AppColors.black : AppColors.white,
                          size: 16,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color:
                                theme.isDark
                                    ? AppColors.black
                                    : AppColors.white,
                          ),
                        ),
                      ],
                    ),
          ),
        );
      },
    );
  }
}
