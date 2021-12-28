import 'package:flutter/material.dart';
import 'package:ntravel/src/domain/city.dart';


/// Responsible for representing a city container.
class CityBox extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final City city;
  final void Function() onTap;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const CityBox({Key? key, 
    required this.city,
    required this.onTap
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            _buildBox(),
            _buildImage(),
            _buildShadow(),
            _buildName()
          ]
        )
      )
    );
  }

  AspectRatio _buildBox() {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
        )
      )
    );
  }

  Positioned _buildImage() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          city.places[0].img,
          fit: BoxFit.cover,
        )
      )
    );
  }

  Positioned _buildShadow() {
    Gradient shadow = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black
      ]
    );

    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: shadow
        )
      )
    );
  }

  Positioned _buildName() {
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14
    );

    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Text(
        city.name,
        textAlign: TextAlign.center,
        style: textStyle
      )
    );
  }
}
