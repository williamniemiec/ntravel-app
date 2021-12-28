import 'package:flutter/cupertino.dart';


/// Responsible for providing device informations.
class DeviceUtils {

  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  DeviceUtils._();


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  static double getFooterHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
