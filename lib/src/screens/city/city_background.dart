import 'package:flutter/material.dart';


/// Responsible for displaying a background image on City screen.
class CityBackground extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final Map<String, dynamic> cityData;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  /// Displays a city image using [cityData] as background image on City screen.
  const CityBackground({
    Key? key,
    required this.cityData,
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 250,
      child: _buildImage(cityData['places'][0]['img'])
    );
  }

  Image _buildImage(String image) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}
