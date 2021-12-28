import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/domain/continent.dart';
import 'package:ntravel/src/domain/country.dart';
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
        Continent continent = appdata.continents[continentIndex];
        List<City> cities = _parseCitiesFromCountry(continent.countries);
        
        return Scaffold(
          key: _scaffoldKey,
          appBar: _buildAppBar(context, continent.name, cities.length),
          backgroundColor: Colors.white,
          drawer: _buildDrawer(context),
          body: _buildBody(context, cities)
        );
      }
    );
  }

  List<City> _parseCitiesFromCountry(List<Country> countries) {
    List<City> cities = [];
    
    for (Country country in countries) {
      cities.addAll(country.cities);
    }
    
    return cities;
  }

  PreferredSizeWidget? _buildAppBar(BuildContext screenContext, 
                                    String continentName, int totalCities) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;

    return CustomAppBar(
      title: "$continentName ($totalCities ${locale.translate('CITIES')})",
      scaffoldKey: _scaffoldKey,
      screenContext: screenContext,
      showBack: true
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      screenContext: screenContext
    );
  }

  GridView _buildBody(BuildContext screenContext, List<City> cities) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        cities.length, 
        (index) => CityBox(
          city: cities[index], 
          onTap: () => _seeCity(screenContext, cities[index])
        )
      )
    );
  }

  void _seeCity(BuildContext screenContext, dynamic cityData) {
    Navigator.pushNamed(screenContext, '/city', arguments: cityData);
  }
}
