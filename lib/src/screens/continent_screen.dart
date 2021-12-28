import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../components/logo.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/citybox.dart';

class ContinentScreen extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Permite q outros widgets usem scaffold

  TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  seeCities(context, continentIndex) {
    print(continentIndex);
    Navigator.pushNamed(context, '/list_city', arguments: continentIndex);
  }

  seeCity(context, selectedCityData) {
//    print(selectedCityData['name']);
    Navigator.pushNamed(context, '/city', arguments: selectedCityData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title: 'Escolha um continente',
          scaffoldKey: _scaffoldKey,
          pageContext: context
        ),
        backgroundColor: Colors.white,
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (ctx, index) {
            String continentName = appdata.data[index]["name"];
            var countries = appdata.data[index]["countries"];
            var cities = [];

            for (var country in countries) {
              cities.addAll(country['cities']);
            }
            
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        '${continentName} (${cities.length})', 
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14
                        )
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Ver cidades', 
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey
                        )
                      ),
                      onPressed: () => seeCities(context, index),
                    ),
                  ],
                ),

                Container(
                  height: 130,
                  margin: EdgeInsets.only(bottom: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (cityContext, cityIndex) {
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: (selectedCityData) => seeCity(context, selectedCityData)
                      );
                    }
                  ),
                )
              ],
            );
          }
        )
      )
    );
  }
}
