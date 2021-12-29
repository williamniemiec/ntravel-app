import 'package:flutter/material.dart';
import 'package:ntravel/src/services/device_service.dart';


/// Responsible for displaying a back button on City screen.
class CityBackButton extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final BuildContext screenContext;
  late final DeviceService _deviceService;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  /// Displays a back button on City screen, redirecting the application to
  /// previous screen based on [screenContext].
  CityBackButton({
    Key? key,
    required this.screenContext
  }) : super(key: key) {
    _deviceService = DeviceService();
  }


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: _deviceService.getStatusBarHeight(screenContext)),
      child: _buildBackButton()
    );
  }

  IconButton _buildBackButton() {
    return IconButton(
      icon: _buildBackIcon(),
      onPressed: () => _redirectToPreviousPage(),
    );
  }

  Icon _buildBackIcon() {
    return const Icon(
      Icons.arrow_back, 
      color: Colors.white
    );
  }

  void _redirectToPreviousPage() {
    Navigator.of(screenContext).pop(); 
  }
}
