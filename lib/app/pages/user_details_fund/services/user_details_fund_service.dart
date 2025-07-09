import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/models/models.dart';
import 'package:dio/dio.dart';

abstract class UserDetailsFundService {
  static Future<String> put(UserFund fund) async {
    final dio = Dio();
    final response = await dio.put('${AppEnv.api}/my_funds/${fund.id}', data: fund.toJson());
    return response.statusMessage!;
  }
}
