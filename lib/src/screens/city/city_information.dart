import 'package:flutter/material.dart';


/// Responsible for displaying city information on City screen.
class CityInformation extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final BuildContext screenContext;
  final dynamic cityData;
  bool isFavorited;
  final void Function(String) onFavoriteCity;


  CityInformation({
    Key? key,
    required this.screenContext,
    required this.cityData,
    required this.isFavorited,
    required this.onFavoriteCity
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double footerHeight = MediaQuery.of(screenContext).padding.bottom;
    var reviewScoreRounded = double.parse(cityData['review']).floor();
    var reviewStarColors = [
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 1 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 2 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 3 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 || reviewScoreRounded % 5 >= 4 ? Colors.blue : Colors.grey, 
      reviewScoreRounded % 5 == 0 ? Colors.blue : Colors.grey, 
    ];

    return ListView(
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
                                )
                              )
                            )
                          ]
                        )
                      ]
                    )
                  ),

                  Container(
                    margin: EdgeInsets.all(15),
                    child: IconButton(
                      icon: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border, 
                        color: Colors.red
                      ),
                      onPressed: () => onFavoriteCity(cityData['name']),
                    )
                  )
                ]
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
                )
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
                )
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
                            )
                          )
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
                          )
                        )
                        
                      ]
                    )
                  )
                )
              )
            ]
          )
        )
      ]
    );
  }
}
