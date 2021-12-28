import 'package:flutter/material.dart';
import 'package:ntravel/src/utils/device_utils.dart';


/// Responsible for displaying a back button on City screen.
class CityBackButton extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final BuildContext screenContext;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  /// Displays a back button on City screen, redirecting the application to
  /// previous screen based on [screenContext].
  const CityBackButton({
    Key? key,
    required this.screenContext
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: DeviceUtils.getStatusBarHeight(context)),
      child: _buildBackButton(context)
    );
  }

  IconButton _buildBackButton(BuildContext context) {
    return IconButton(
      icon: _buildBackIcon(),
      onPressed: () => _redirectToPreviousPage(context),
    );
  }

  Icon _buildBackIcon() {
    return const Icon(
      Icons.arrow_back, 
      color: Colors.white
    );
  }

  void _redirectToPreviousPage(BuildContext context) {
    Navigator.of(context).pop(); 
  }
}
