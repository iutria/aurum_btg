import 'package:aurum_btg/app/app.dart';
import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  await initHiveBox();
  runApp(MultiProvider(providers: multiProvider, child: const App()));
}

