import 'package:dio/dio.dart';

class RequestInterceptors extends QueuedInterceptorsWrapper {
  Dio dio;
  RequestInterceptors(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool withToken = options.extra['token'] ?? true;
    if (withToken) {
      /*  UserModel userModel = hiveDB.getData(
        boxName: BoxesNames.userModel,
        key: KeysNames.user,
        boxType: BoxType.USERMODEL,
        defaultValue: UserModel(
          id: 0,
          email: "",
          token: "",
          phoneNumber: "",
          userName: "",
          image: "",
          points: 0,
          credit: 0,
        ),
      );*/
      var token = "W";
      options.headers.addAll({
        "Authorization": token,
        "lang": "en",
      });
    }
    return handler.next(options);
  }
}
