import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../components/logo.dart';
import '../components/custom_drawer.dart';

class CityScreen extends StatefulWidget {

  @override
  _CityScreen createState() => _CityScreen();
}

class _CityScreen extends State<CityScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Permite q outros widgets usem scaffold

  TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  bool isFavorited = false;

  favoriteCity(appdata, cityName) {
    setState(() {
      isFavorited = appdata.favorite(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerHeight = MediaQuery.of(context).padding.bottom;
    
    var reviewScoreRounded = double.parse(cityData['review']).floor();
    var reviewStarColors = [
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 1 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 2 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 3 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 4 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 ? Colors.blue : Colors.grey, 
    ];

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          drawer: CustomDrawer(
            pageContext: context
          ),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 250,
                child: Image.network(
                  cityData['places'][0]['img'],
                  fit: BoxFit.cover,
                )
              ),
              
              ListView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 220),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), 
                        topRight: Radius.circular(20)
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child:Text(
                                      cityData['name'],
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  ),
                                  
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: reviewStarColors[0], size: 15),
                                      Icon(Icons.star, color: reviewStarColors[1], size: 15),
                                      Icon(Icons.star, color: reviewStarColors[2], size: 15),
                                      Icon(Icons.star, color: reviewStarColors[3], size: 15),
                                      Icon(Icons.star, color: reviewStarColors[4], size: 15),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          cityData['review'],
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      )
                                    ],
                                  )
                                ],
                              )
                            ),

                            Container(
                              margin: EdgeInsets.all(15),
                              child: IconButton(
                                icon: Icon(
                                  (isFavorited || appdata.isFavorited(cityData['name'])) ? Icons.favorite : Icons.favorite_border, 
                                  color: Colors.red
                                ),
                                onPressed: () => favoriteCity(appdata, cityData['name']),
                              ),
                            )
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(
                            top: 0, 
                            left: 15, 
                            right: 15, 
                            bottom: 10
                          ),
                          child: Text(
                            cityData['description'],
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            )
                          ),
                        ),

                        Divider(thickness: 1),

                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'PRINCIPAIS PONTOS TURISTICOS',
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),

                        GridView.count(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 0, bottom: footerHeight),
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 10 / 11,
                          children: List.generate(
                            cityData['places'].length, 
                            (index) => Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: ClipRRect(
                                        child: Image.network(
                                          cityData['places'][index]['img'],
                                          fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      cityData['places'][index]['name'],
                                      style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      )
                                    ),
                                  )
                                  
                                ],
                              ),
                            )
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),

              Container(
                height: 50,
                margin: EdgeInsets.only(top: statusBarHeight),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () { Navigator.of(context).pop(); },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
