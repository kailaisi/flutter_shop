import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'HttpError.dart';
import 'LoggerIntercepter.dart';
import 'httpHeader.dart';

///http请求成功回调
typedef HttpSuccessCallback<T> = void Function(dynamic data);

///失败回调
typedef HttpFailureCallback = void Function(HttpError data);

class HttpManager {
  Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();

  static HttpManager _instance = HttpManager._internal();
  Dio _dio;
  factory HttpManager() => _instance;

  //私有构造函数
  HttpManager._internal() {
    if (null == _dio) {
      _dio = new Dio(new BaseOptions(
          baseUrl: Address.BASE_URL_RELEASE,
          connectTimeout: 15000,
          headers: DioHttpHeaders));
      _dio.interceptors.add(new LogsIntercepter());
    }
  }

  // 初始化
  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> intercepters}) {
    _dio.options = _dio.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (intercepters != null && intercepters.isNotEmpty) {
      _dio.interceptors.addAll(intercepters);
    }
  }

  void get(
    String url, {
    Map<String, dynamic> params,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback failureCallback,
  }) async {}

  void _request({
    @required String url,
    String method,
    data,
    Map<String, dynamic> params,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
    @required String tag,
  }) async {
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.none) {
      if (errorCallback != null) {
        errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常,请稍后重试"));
      }
      return;
    }
    params = params ?? {};
    method = method ?? "GEt";
    options?.method = method;
    options = options ??
        Options(
          method: method,
        );
    url = _restfulUrl(url, params);
    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken =
            _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _dio.request(url,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);
      int status = response.data["code"];
      if (status == 0) {
        if (successCallback != null) {
          successCallback(response.data["data"]);
        }
      } else {
        if (status == 105) {
          errorCallback(HttpError(HttpError.NETWORK_ERROR, "服务器发生错误"));
        }
      }
    } catch (e) {}
  }

  String _restfulUrl(String url, Map<String, dynamic> params) {
    params.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(":$key", value.toString());
      }
    });
    return url;
  }
}

class Address {
  static final BASE_URL_RELEASE = "http://www.baidu.com";
}
