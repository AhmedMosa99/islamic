import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:islamic_unveristy/moduls/auth/view/screen/web_view.dart';
import 'package:islamic_unveristy/services/local_data/share_pref.dart';

import '../../shared/constant.dart';

class ApiDio {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: ''));

  ApiDio._internal();

  static final _singleton = ApiDio._internal();

  factory ApiDio() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: 'https://staging.iu.edu.sa/mobileapis/',
        receiveTimeout: 15000, // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
        contentType: Headers.jsonContentType,
        headers: {
          'Accept': 'application/json',
        }));

    // dio.interceptors.addAll({
    //   AppInterceptors(),
    // });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print(err);
    // Assume 401 stands for token expired
    if (err.response?.statusCode == 401) {
      print('error');
      await SharePref.init();
      await SharePref.removeKey('token');
      token = null;
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (s) {
        return WebViewCheck();
      }), (route) => false);
    }
  }
}

//       // token = await SharePref.getData(key: 'token');
//       // await SharePref.setData(key: 'isRegister', data: false);
//
//
//       // var options = error.response!.requestOptions;
//       // // If the token has been updated, repeat directly.
//       // if (csrfToken != options.headers['csrfToken']) {
//       //   options.headers['csrfToken'] = csrfToken;
//       //   //repeat
//       //   dio.fetch(options).then(
//       //     (r) => handler.resolve(r),
//       //     onError: (e) {
//       //       handler.reject(e);
//       //     },
//       //   );
//       //   return;
//       // }
//       // tokenDio.get('v1/get/user').then((d) {
//       //   //update csrfToken
//       //   options.headers['csrfToken'] = csrfToken = d.data['data']['token'];
//       // }).then((e) {
//       //   //repeat
//       //   dio.fetch(options).then(
//       //     (r) => handler.resolve(r),
//       //     onError: (e) {
//       //       handler.reject(e);
//       //     },
//       //   );
//       // });
//       // return;
//       return handler.next(err);
//     }
//     // await _shouldRetry(err, handler);
//
//     return handler.next(err);
//   }
// }

// _shouldRetry(DioError err, handler) async {
//   if (err.type == DioErrorType.other && err.error is SocketException) {
//     try {
//       handler.resolve(await scheduleRequestRetry(err.requestOptions));
//     } catch (e) {
//       // Let any new error from the retrier pass through
//       handler.next(e as DioError);
//     }
//   }
// }

// Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
//   final dio = ApiDio.createDio();
//   final connectivity = Connectivity();
//   final responseCompleter = Completer<Response>();
//   late StreamSubscription streamSubscription;
//   streamSubscription = connectivity.onConnectivityChanged.listen(
//     (connectivityResult) async {
//       print(connectivityResult);
//       if (connectivityResult != ConnectivityResult.none) {
//         streamSubscription.cancel();
//         // Complete the completer instead of returning
//         responseCompleter.complete(
//           dio.request(requestOptions.path,
//               cancelToken: requestOptions.cancelToken,
//               data: requestOptions.data,
//               onReceiveProgress: requestOptions.onReceiveProgress,
//               onSendProgress: requestOptions.onSendProgress,
//               queryParameters: requestOptions.queryParameters,
//               options: requestOptions.data),
//         );
//       } else {
//         print('Connection less Still');
//       }
//     },
//   );
//
//   return responseCompleter.future;
// }
