import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: Duration(milliseconds: HttpConfig.timeout));
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
                      String method = "get",
                      params,
                      inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);

    // 全局拦截器
    // 创建默认的全局拦截器
    // 2.添加第一个拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // 1.在进行任何网络请求的时候, 可以添加一个loading显示

        // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token

        // 3.对参数进行一些处理,比如序列化处理等
        print("拦截了请求");
        return handler.next(options);
      },
      onResponse: (Response<dynamic> response,
          ResponseInterceptorHandler handler) {
            print("拦截了响应");
            handler.next(response);
        },
      onError: ( DioException error,
          ErrorInterceptorHandler handler,) {
            print("拦截了错误");
            return handler.next(error);
          },
    );

    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioException catch(e) {
      return Future.error(e);
    }
  }
}