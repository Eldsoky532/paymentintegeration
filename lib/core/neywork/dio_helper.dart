import 'package:dio/dio.dart';
import 'package:paymentintegeration/core/neywork/constant.dart';

class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postDataDio({required String url,Map<String,dynamic>? data}) async {
    return await dio.post(url,data: data);
  }
}
