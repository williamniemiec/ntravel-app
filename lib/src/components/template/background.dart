import 'package:flutter/material.dart';


/// Responsible for application background.
class Background extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final Widget? body;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const Background({Key? key, 
    this.body
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/resources/assets/background.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: body
    );
  }
}
