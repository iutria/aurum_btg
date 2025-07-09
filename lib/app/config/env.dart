import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppEnv {
  static final String api = dotenv.env['API_URL'] ?? '';
}