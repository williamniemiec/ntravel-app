import 'package:flutter/cupertino.dart';

class DeviceUtils {

  DeviceUtils._();

  static double getFooterHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
