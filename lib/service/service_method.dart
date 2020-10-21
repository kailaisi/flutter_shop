import 'package:dio/dio.dart';
import 'package:flutter_shop/service/service_url.dart';

Future getHomePageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    var formatData = {};
    response = await dio.post(servicePath["homePageContent"], data: formatData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端端口异常");
    }
  } catch (e) {
    return print("Error=====${e}");
  }
}
