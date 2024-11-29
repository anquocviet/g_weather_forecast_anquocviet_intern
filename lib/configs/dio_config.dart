import 'package:dio/dio.dart';

// Tạo một lớp Singleton để Dio được sử dụng toàn cục
class DioConfig {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.weatherapi.com/v1', // Thay đổi base URL nếu cần
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  DioConfig._();

  // Getter để lấy instance của Dio
  static Dio get dio {
    // Nếu cần thêm interceptor, header, hoặc các cấu hình đặc biệt, có thể thêm ở đây
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Thêm API key vào header
        options.headers['key'] = '9dbb716950f34b37b8344710242711';
        return handler.next(options);
      },
    ));
    return _dio;
  }
}
