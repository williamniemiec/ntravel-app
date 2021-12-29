import 'package:flutter/material.dart';


/// Responsible for providing device information.
class DeviceService {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  static final DeviceService _instance = DeviceService._internal();


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  DeviceService._internal();


  //---------------------------------------------------------------------------
  //		Factory
  //---------------------------------------------------------------------------
  factory DeviceService() {
    return _instance;
  }


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  double getFooterHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
