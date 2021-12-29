import 'package:flutter/material.dart';
import 'package:ntravel/src/domain/continent.dart';
import 'package:ntravel/src/services/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/template/custom_app_bar.dart';
import 'package:ntravel/src/components/template/custom_drawer.dart';
import 'package:ntravel/src/components/citybox.dart';


/// Responsible for displaying Continent screen.
class ContinentScreen extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late final StorageService? _storageService;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  ContinentScreen({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        _storageService = StorageService(appdata);

        return Scaffold(
          key: _scaffoldKey,
          appBar: _buildAppBar(context),
          backgroundColor: Colors.white,
          drawer: _buildDrawer(context),
          body: _buildBody(context)
        );
      }
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext screenContext) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;

    return CustomAppBar(
      title: locale.translate("SELECT_A_CONTINENT"),
      scaffoldKey: _scaffoldKey,
      screenContext: screenContext
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      screenContext: screenContext
    );
  }

  ListView _buildBody(BuildContext screenContext) {
    return ListView.builder(
      itemCount: _storageService!.getTotalContinents(),
      itemBuilder: (ctx, continentIndex) {
        Continent continent = _storageService!.getContinentByIndex(continentIndex);
        List<City> cities = _storageService!.getCitiesFromContinent(continent);
        
        return Column(
          children: [
            _buildContinentHeader(screenContext, continent.name, cities.length, 
                                  continentIndex),
            _buildContinentCities(screenContext, cities)
          ]
        );
      }
    );
  }

  Row _buildContinentHeader(BuildContext screenContext, String continentName, 
                            int totalCities, int continentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeaderLeft(continentName, totalCities),
        _buildHeaderRight(screenContext, continentIndex),
      ],
    );
  }

  Container _buildHeaderLeft(String continentName, int totalCities) {
    TextStyle textStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue',
      fontSize: 14
    );

    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Text(
        '$continentName ($totalCities)', 
        style: textStyle
      ),
    );
  }

  TextButton _buildHeaderRight(BuildContext screenContext, int continentIndex) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;
    TextStyle textStyle = const TextStyle(
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.grey
    );

    return TextButton(
      child: Text(
        locale.translate("SEE_CITIES"), 
        style: textStyle
      ),
      onPressed: () => _handleSeeCities(screenContext, continentIndex),
    );
  }

  void _handleSeeCities(BuildContext screenContext, int continentIndex) {
    Navigator.pushNamed(
      screenContext, 
      '/list_city', 
      arguments: continentIndex
    );
  }

  Container _buildContinentCities(BuildContext screenContext, 
                                  List<City> cities) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cities.length,
        itemBuilder: (cityContext, cityIndex) {
          return CityBox(
            city: cities[cityIndex],
            onTap: () => _handleSeeCity(screenContext, cities[cityIndex])
          );
        }
      ),
    );
  }

  void _handleSeeCity(BuildContext screenContext, City selectedCityData) {
    Navigator.pushNamed(
      screenContext, 
      '/city', 
      arguments: selectedCityData
    );
  }
}
