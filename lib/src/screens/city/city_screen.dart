import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/screens/city/city_background.dart';
import 'package:ntravel/src/screens/city/city_information.dart';
import 'package:ntravel/src/screens/city/city_back_button.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/custom_drawer.dart';


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

  Widget _buildDrawer(BuildContext context) {
    return CustomDrawer(
      pageContext: context
    );
  }

  Stack _buildBody(BuildContext context, AppData appdata) {
    Map<String, dynamic> cityData = _parseScreenArguments(context);

    return Stack(
      children: [
        CityBackground(cityData: cityData),
        CityInformation(
          screenContext: context,
          cityData: cityData,
          isFavorited: isFavorited || appdata.isFavorited(cityData['name']),
          onFavoriteCity: (cityName) => _handleFavoriteCity(appdata, cityName)
        ),
        CityBackButton(screenContext: context)
      ]
    );
  }

  Map<String, dynamic> _parseScreenArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  }

  void _handleFavoriteCity(appdata, cityName) {
    setState(() {
      isFavorited = appdata.favorite(cityName);
    });
  }
}
