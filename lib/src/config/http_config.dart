import 'dart:io';


/// Responsible for configuring application http requests.
class HttpConfig extends HttpOverrides {

  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context) // Avoids certificate error
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
