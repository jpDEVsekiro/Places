import 'package:dio/dio.dart';
import 'package:my_places/src/domain/models/method.dart';
import 'package:my_places/src/domain/providers/i_http.dart';

class DioHttp implements IHttp {
  Dio? _dio;

  Future<bool> _init() async {
    var baseUrl = 'https://viacep.com.br/ws/';

    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 120)));
    _initInterceptors();
    return true;
  }

  void _initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          return handler.next(err);
        },
      ),
    );
  }

  @override
  Future<dynamic> request(
      {required String url, required Method method, dynamic params}) async {
    Response response;

    if (await _init() == false) {
      return false;
    }

    try {
      if (method == Method.post) {
        response = await _dio!.post(
          url,
          data: params,
        );
      } else if (method == Method.delete) {
        response = await _dio!.delete(url);
      } else if (method == Method.patch) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
