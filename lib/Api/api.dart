import '../HttpManager/httpManager.dart';
import '../HttpManager/reqMethod.dart';

class Api {
  static init(data) {
    return DioUtils.request('***json',
        method: ReqMethod.GET, data: data);
  }
}
