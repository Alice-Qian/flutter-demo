import 'package:dio/dio.dart';
import 'dart:async';
import '../Config/config.dart';
import '../enum/reqMethod.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  // default options
  static const int _CONNECT_TIMEOUT = 10000;
  static const int _RECEIVE_TIMEOUT = 3000;

  // 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
          baseUrl: Config.apiHost,
          connectTimeout: _CONNECT_TIMEOUT,
          receiveTimeout: _RECEIVE_TIMEOUT,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          headers: {
            'Accept': 'application/json,*/*',
            'Content-Type': 'application/json'
          });
      dio = new Dio(options);
    }

    return dio;
  }

  /// request method
  static Future request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? ReqMethod.GET;

    /// restful 请求处理

    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    Dio dio = createInstance();
    List<dynamic> result;

    try {
      Response response = await dio.request(url,
          data: data, options: new Options(method: ReqMethodValue[method]));

      var responseData = response.data;

      if (responseData['code'] == '200') {
        result = responseData['data'];
      } else {
        print('errMsg:${responseData['msg']}');
      }

      /// 打印响应相关信息
      // print('响应数据：' + response.toString());
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print('请求出错：' + e.toString());
    }

    return result;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
