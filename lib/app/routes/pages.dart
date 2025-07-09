
import 'package:aurum_btg/app/pages/pages.dart';
import 'package:aurum_btg/app/routes/app_routes.dart';

abstract class Pages{
  static final allPages = {
    Routes.home: (context)=>Home(),
    Routes.funds: (context)=>Funds(),
    Routes.error: (context)=>ErrorPage(),
    Routes.profile: (context)=>Profile(),
    Routes.detailsFund: (context)=>DetailsFund(),
    Routes.splashScreen: (context)=>SplashScreen(),
  };
}
