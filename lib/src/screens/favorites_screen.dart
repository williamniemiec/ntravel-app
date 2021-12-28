import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/citybox.dart';
import 'package:ntravel/src/components/template/custom_app_bar.dart';
import 'package:ntravel/src/components/template/custom_drawer.dart';


/// Responsible for displaying Favorites screen.
class FavoritesScreen extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  FavoritesScreen({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        List favorites = appdata.getFavorites();

        return Scaffold(
          key: _scaffoldKey,
          appBar: _buildAppBar(context),
          backgroundColor: Colors.white,
          drawer: _buildDrawer(context),
          body: _buildBody(context, favorites)
        );
      }
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext screenContext) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;

    return CustomAppBar(
      title: locale.translate("FAVORITED_CITIES"),
      scaffoldKey: _scaffoldKey,
      pageContext: screenContext
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      pageContext: screenContext
    );
  }

  GridView _buildBody(BuildContext screenContext, List<dynamic> favorites) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        favorites.length, 
        (index) => CityBox(
          data: favorites[index], 
          onTap: () => _handleSeeCity(screenContext, favorites[index])
        )
      )
    );
  }

  void _handleSeeCity(BuildContext screenContext, dynamic cityData) {
    Navigator.of(screenContext).pushNamed("/city", arguments: cityData); 
  }
}
