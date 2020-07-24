import '../httpManager/httpManager.dart';
import '../httpManager/reqMethod.dart';

class Api {
  static init(data) {
    return DioUtils.request('/api/recommend/RecommendAPI/init.json',
        method: ReqMethod.GET, data: data);
  }
}
