import 'dart:convert';
import 'dart:io';

abstract class APIHelper {
  static const String url =
      'http://185.119.88.94:8080/crm-jsf/WebServiceServlet?account=1&wsMethod=';

  static final JsonCodec jsonCodec = const JsonCodec();
}

// If host or port are updated, edit below in order to accept bad certificates
class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) =>
              (host == '185.119.88.94' && port == 8443);
  }
}
