import 'package:flutter/material.dart';


/// Responsible for representing a city container.
class CityBox extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final data;
  final void Function() onTap;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  CityBox({
    required this.data,
    required this.onTap
  });


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  data['places'][0]['img'],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ]
                  )
                ),
              )
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Text(
                data['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                )
              )
            )
          ],
        )
      )
    );
  }
}
