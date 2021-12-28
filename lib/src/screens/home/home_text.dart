import 'package:flutter/material.dart';


/// Responsible for displaying texts on Home screen.
class HomeText extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final String title;
  

  //---------------------------------------------------------------------------
  //		 Constructor
  //---------------------------------------------------------------------------
  const HomeText({
    Key? key,
    required this.title
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildText(),
      margin: _buildMargin()
    );
  }

  Text _buildText() {
    const textStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
    );

    return Text(
      title,
      style: textStyle,
    );
  }

  EdgeInsets _buildMargin() {
    return const EdgeInsets.only(
      bottom: 15, 
      top: 15
    );
  }
}
