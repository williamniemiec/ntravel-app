import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/screens/city/city_background.dart';
import 'package:ntravel/src/screens/city/city_information.dart';
import 'package:ntravel/src/screens/city/city_back_button.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/template/custom_drawer.dart';


/// Responsible for displaying City screen.
class CityScreen extends StatefulWidget {
  
  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const CityScreen({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  _CityScreen createState() => _CityScreen();
}


class _CityScreen extends State<CityScreen> {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool isFavorited = false;


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          drawer: _buildDrawer(context),
          body: _buildBody(context, appdata)
        );
      }
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      screenContext: screenContext
    );
  }

  Stack _buildBody(BuildContext screenContext, AppData appdata) {
    City city = _parseScreenArguments(screenContext);

    return Stack(
      children: [
        CityBackground(city: city),
        CityInformation(
          screenContext: screenContext,
          city: city,
          isFavorited: isFavorited || appdata.isFavorited(city.name),
          onFavoriteCity: (cityName) => _handleFavoriteCity(appdata, cityName)
        ),
        CityBackButton(screenContext: screenContext)
      ]
    );
  }

  City _parseScreenArguments(BuildContext screenContext) {
    return ModalRoute
      .of(screenContext)!
      .settings
      .arguments as City;
  }

  void _handleFavoriteCity(appdata, cityName) {
    setState(() {
      isFavorited = appdata.favorite(cityName);
    });
  }
}
