import 'package:flutter/material.dart';


/// Responsible for representing the application logo.
class Logo extends StatelessWidget {
  
  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const Logo({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/resources/assets/logo.png',
      width: 200,
    );
  }
}
