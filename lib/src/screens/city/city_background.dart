import 'package:flutter/material.dart';
import 'package:ntravel/src/domain/city.dart';


/// Responsible for displaying a background image on City screen.
class CityBackground extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final City city;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  /// Displays a city image using the image of the first place of the [city] 
  /// as background image on City screen.
  const CityBackground({
    Key? key,
    required this.city,
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
      child: _buildImage(city.places[0].img)
    );
  }

  Image _buildImage(String image) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}
