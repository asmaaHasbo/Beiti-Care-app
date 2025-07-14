import 'dart:io';

typedef FromJson<T> = T Function(Map<String,dynamic> json);

enum ClientMethod { get, post, put, delete,patch }

class RequestConfig<T> {
  late final dynamic queryParameters;
  late final dynamic data;
  late final String endpoint;
  late final ResponseMapper<T>? response;
  late final ClientMethod clientMethod;

  RequestConfig({
    required this.endpoint,
    this.response,
    required this.clientMethod,
    this.queryParameters,
    this.data,
  });

  @override
  String toString() {
    return 'RequestConfig{queryParameters: $queryParameters, data: $data, endpoint: $endpoint, response: $response, clientMethod: $clientMethod}';
  }
}

class ResponseMapper<T> {
  final T? value;
  final FromJson<T>? fromJson;

  ResponseMapper({this.value, this.fromJson})
      : assert(() {
          if (fromJson == null && value == null) {
            return false;
          }
          return true;
        }(), "value and fromJson cannot be both null");
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
