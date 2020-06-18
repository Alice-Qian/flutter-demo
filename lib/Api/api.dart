import '../HttpManager/httpManager.dart';
import '../enum/reqMethod.dart';

class Api {
  static init(data) {
    return DioUtils.request('/api/****',
        method: ReqMethod.GET, data: data);
  }
}
