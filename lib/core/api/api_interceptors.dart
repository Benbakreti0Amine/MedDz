import 'package:dio/dio.dart';
import '../../cache/cachehelper.dart';
import 'end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Check if the request path matches one of the favorite-related endpoints
    if (options.path == EndPoint.getFavoriteDoctors ||
        options.path == EndPoint.addFavoriteDoctor ||
        options.path.startsWith(EndPoint.removeFavoriteDoctor)) {
      final token = CacheHelper().getData(key: ApiKey.token);
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
      }
    }
    super.onRequest(options, handler);
  }
}
