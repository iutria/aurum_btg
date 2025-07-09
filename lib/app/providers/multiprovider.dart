import 'package:aurum_btg/app/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> multiProvider = [
  ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
  ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
];
