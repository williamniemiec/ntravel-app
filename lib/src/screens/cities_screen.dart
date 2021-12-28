import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/citybox.dart';
import 'package:ntravel/src/components/template/custom_app_bar.dart';
import 'package:ntravel/src/components/template/custom_drawer.dart';


/// Responsible for displaying Cities screen.
class CitiesScreen extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  CitiesScreen({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final int continentIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        var continent = appdata.data[continentIndex];
        List<dynamic> cities = _parseCitiesFromCountry(continent['countries']);
        
        return Scaffold(
          key: _scaffoldKey,
          appBar: _buildAppBar(context, continent['name'], cities.length),
          backgroundColor: Colors.white,
          drawer: _buildDrawer(context),
          body: _buildBody(context, cities)
        );
      }
    );
  }

  List<dynamic> _parseCitiesFromCountry(List countries) {
    List<dynamic> cities = [];
    
    for (var country in countries) {
      cities.addAll(country['cities']);
    }
    
    return cities;
  }

  PreferredSizeWidget? _buildAppBar(BuildContext screenContext, 
                                    String continentName, int totalCities) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;

    return CustomAppBar(
      title: "$continentName ($totalCities ${locale.translate('CITIES')})",
      scaffoldKey: _scaffoldKey,
      pageContext: screenContext,
      showBack: true
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      pageContext: screenContext
    );
  }

  GridView _buildBody(BuildContext screenContext, List<dynamic> cities) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        cities.length, 
        (index) => CityBox(
          data: cities[index], 
          onTap: () => _seeCity(screenContext, cities[index])
        )
      )
    );
  }

  void _seeCity(BuildContext screenContext, dynamic cityData) {
    Navigator.pushNamed(screenContext, '/city', arguments: cityData);
  }
}
