import 'dart:convert';
import 'dart:io';

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

Future getHotPageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    var formatData = {};
    response =
        await dio.post(servicePath["homePageBelowConten"], data: formatData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端端口异常");
    }
  } catch (e) {
    return print("Error=========${e}");
  }
}

Future request(url, {formdata}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    if (formdata == null) {
      response = await dio.post(servicePath[url]);
    } else {
      print(formdata.toString());
      response = await dio.post(servicePath[url], data: formdata);
    }
    if (response.statusCode == 200) {
      print(response.data);
      return json.decode(response.data);
    } else {
      throw Exception("后端端口异常");
    }
  } catch (e) {
    return print("Error=========${e}");
  }
}
