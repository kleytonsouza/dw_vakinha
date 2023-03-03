import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final acessToken = sp.getString("acessToken");
    options.headers['Authorization'] = 'Bearer $acessToken';

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // ignore: todo
      // TODO: redirecionar o usuario para a tela de home
      final sp = await SharedPreferences.getInstance();
      sp.clear();
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}
