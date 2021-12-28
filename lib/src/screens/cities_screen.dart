import 'package:ntravel/src/components/citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/custom_app_bar.dart';
import 'package:ntravel/src/components/custom_drawer.dart';

class CitiesScreen extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Permite q outros widgets usem scaffold

  TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  seeCity(context, cityData) {
    Navigator.pushNamed(context, '/city', arguments: cityData);
    //print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {

    final continentIndex = ModalRoute.of(context)!.settings.arguments;
    

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        var cities = [];

        for (var country in appdata.data[continentIndex]['countries']) {
          cities.addAll(country['cities']);
        }
        
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            title: "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            showBack: true
          ),
          backgroundColor: Colors.white,
          drawer: CustomDrawer(
            pageContext: context
          ),
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              cities.length, 
              (index) => CityBox(
                data: cities[index], 
                onTap: () => seeCity(context, cities[index])
              )
            )
          )
        );
      }
    );
  }
}
