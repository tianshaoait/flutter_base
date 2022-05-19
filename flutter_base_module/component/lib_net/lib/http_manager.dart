import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:lib_net/http_exception_handle.dart';
import 'package:lib_net/http_base_data.dart' as httpBaseData;

const int _connectTimeout = 15000; //15s
const int _receiveTimeout = 15000;
const int _sendTimeout = 10000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);
//typedef SuccessListCallback<T> = Function(List<T> data);

class HttpManager {

  static Dio _dio;

  static Dio createInstance(String baseUrl) {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
//          contentType: "application/json; charset=utf-8", // 适用于post form表单提交
        responseType: ResponseType.json,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
//        baseUrl: httpBaseData.HttpConstant.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
      );
      _dio = new Dio(options);
    }
    _dio.options.headers = httpBaseData.HttpConstant.httpHeader;
//    _dio.options.baseUrl = httpBaseData.HttpConstant.baseUrl;
    _dio.options.baseUrl = baseUrl;
//    print("app.token: createInstance:" + app.token);
    print("app.token: createInstance:" + _dio.options.headers.toString());
    print("app.token: baseUrl:" + _dio.options.baseUrl);
    return _dio;
  }

  // 清空 dio 对象
  static clear() {
    _dio = null;
  }

  // 请求，返回参数为 T
  // method：请求方法，Method.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  static Future request<T>(Method method,String baseUrl, String path, dynamic params,
      {Success success, Fail fail}) async {
    try {
      //没有网络
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！', fail);
        return;
      }
      Dio _dio = createInstance(baseUrl);
      Response response = await _dio.request(path,
          queryParameters: params, options: Options(method: MethodValues[method]));
      if (response != null) {
        if (success != null) {
          success(response.data);
        }
      } else {
        _onError(ExceptionHandle.unknown_error, '未知错误', fail);
      }
    } on DioError catch (e) {
//      LogUtils.print_('请求出错：' + e.toString());
      print('requestFormData1 请求出错：' + e.toString());
      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg, fail);
    }
  }


  static Future requestFormData<T>(Method method,String baseUrl, String path, dynamic params,
      {Success success, Fail fail}) async {
    try {
      //没有网络
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！', fail);
        print('网络异常，请检查你的网络！');
        return;
      }
      Dio _dio = createInstance(baseUrl);
      Response response = await _dio.request(path,
          queryParameters: params, options: Options(method: MethodValues[method]));
      if (response != null) {
        if (success != null) {
          success(response.data);
        }
      } else {
        _onError(ExceptionHandle.unknown_error, '未知错误', fail);
        print('未知错误');
      }
    } on DioError catch (e) {
//      LogUtils.print_('请求出错：' + e.toString());
      print('requestFormData 请求出错：' + e.toString());
      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg, fail);
    }
  }

}


void _onError(int code, String msg, Fail fail) {
  if (code == null) {
    code = ExceptionHandle.unknown_error;
    msg = '未知异常';
  }
  print('接口请求异常： code: $code, msg: $msg');
  if (fail != null) {
    fail(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }
//使用：MethodValues[Method.POST]
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};
