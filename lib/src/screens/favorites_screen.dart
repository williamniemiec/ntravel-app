import 'package:flutter/material.dart';
import 'package:ntravel/src/services/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/domain/city.dart';
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
  StorageService? _storageService;


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
      title: locale.translate("FAVORITED_CITIES"),
      scaffoldKey: _scaffoldKey,
      screenContext: screenContext
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      screenContext: screenContext
    );
  }

  GridView _buildBody(BuildContext screenContext) {
    List<City> favorites = _storageService!.getFavorites();

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        favorites.length, 
        (index) => CityBox(
          city: favorites[index], 
          onTap: () => _handleSeeCity(screenContext, favorites[index])
        )
      )
    );
  }

  void _handleSeeCity(BuildContext screenContext, dynamic cityData) {
    Navigator.of(screenContext).pushNamed("/city", arguments: cityData); 
  }
}
