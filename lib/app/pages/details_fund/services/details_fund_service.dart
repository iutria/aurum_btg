import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/models/models.dart';
import 'package:dio/dio.dart';

abstract class DetailsFundService {
  static Future<String> save(UserFund fund) async {
    final dio = Dio();
    final response = await dio.post('${AppEnv.api}/my_funds', data: fund.toJson());
    return response.statusMessage!;
  }
}
