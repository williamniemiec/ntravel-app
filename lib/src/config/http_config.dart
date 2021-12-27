import 'dart:io';

class HttpConfig extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context) // Avoids certificate error
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
