import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';


/// Responsible for representing application drawer.
class CustomDrawer extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final BuildContext screenContext;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const CustomDrawer({Key? key, 
    required this.screenContext
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(locale),
          _buildHomeOption(locale),
          _buildSelectContinentOption(locale),
          _buildSearchCityOption(locale),
          _buildFavoritesOption(locale),
        ]
      )
    );
  }

  DrawerHeader _buildHeader(LocalesConfig locale) {
    BoxDecoration headerStyle = const BoxDecoration(
      color: Colors.blue
    );

    return DrawerHeader(
      decoration: headerStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderTitle(),
          _buildHeaderSubtitle(locale)
        ]
      )
    );
  }

  Text _buildHeaderTitle() {
    TextStyle headerTitleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Helvetica Neue',
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );

    return Text(
      'nTravel',
      style: headerTitleStyle
    );
  }

  Text _buildHeaderSubtitle(LocalesConfig locale) {
    TextStyle headerSubtitleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Helvetica Neue',
      fontSize: 12
    );

    return Text(
      locale.translate("APP_DESCRIPTION"),
      style: headerSubtitleStyle
    );
  }

  ListTile _buildHomeOption(LocalesConfig locale) {
    return _buildHeaderOption(
      title: locale.translate("HOME"),
      route: '/home',
      icon: Icons.home
    );
  }

  ListTile _buildHeaderOption({
    required String title, 
    required String route, 
    required IconData icon
  }) {
    return ListTile(
      title: Text(title),
      onTap: () { Navigator.pushNamed(screenContext, route); },
      leading: Icon(icon),
    );
  }

  ListTile _buildSelectContinentOption(LocalesConfig locale) {
    return _buildHeaderOption(
      title: locale.translate("SELECT_CONTINENT"),
      route: '/continent',
      icon: Icons.public
    );
  }

  ListTile _buildSearchCityOption(LocalesConfig locale) {
    return _buildHeaderOption(
      title: locale.translate("SEARCH_CITY"),
      route: '/search',
      icon: Icons.search
    );
  }

  ListTile _buildFavoritesOption(LocalesConfig locale) {
    return _buildHeaderOption(
      title: locale.translate("FAVORITES"),
      route: '/favorites',
      icon: Icons.favorite
    );
  }
}
