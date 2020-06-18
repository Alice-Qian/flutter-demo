import '../httpManager/httpManager.dart';
import '../httpManager/reqMethod.dart';

class Api {
  static init(data) {
    return DioUtils.request('**',
        method: ReqMethod.GET, data: data);
  }
}
