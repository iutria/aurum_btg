import 'package:aurum_btg/app/config/config.dart';
import 'package:aurum_btg/app/models/models.dart';
import 'package:dio/dio.dart';

abstract class FundsUserService {
  static Future<List<UserFund>> get(bool? filter) async {
    final dio = Dio();
    final response = await dio.get('${AppEnv.api}/my_funds');
    final List<UserFund> data =
        (response.data as List?)
            ?.map((item) => UserFund.fromJson(item as Map<String, dynamic>))
            .toList() ??
        [];

    if (filter == true) {
      return data.where((fund) => fund.status == true).toList();
    }
    return data;
  }
}
