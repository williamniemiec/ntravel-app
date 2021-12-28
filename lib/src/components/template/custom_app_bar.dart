import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// Responsible for representing application bar.
class CustomAppBar extends AppBar {

  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  CustomAppBar({
    Key? key, 
    required GlobalKey<ScaffoldState> scaffoldKey,
    required BuildContext screenContext,
    String title = '',
    bool hideSearch = false,
    bool showBack = false,
  }) : super(
    key: key, 
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.white,
    elevation: 0,   // Remove bottom shadow
    centerTitle: false,
    title: _buildTitle(title),
    actions: _buildActions(hideSearch, screenContext),
    leading: _buildLeading(showBack, screenContext, scaffoldKey)
  );


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  static Text _buildTitle(String title) {
    TextStyle textStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

    return Text(
      title, 
      style: textStyle
    );
  }

  static List<Widget> _buildActions(bool hideSearch, BuildContext screenContext) {
    return [
      hideSearch ? Container() : _buildSearchIcon(screenContext)
    ];
  }

  static IconButton _buildSearchIcon(BuildContext screenContext) {
    return _buildThemeButtonIcon(
      icon: Icons.search, 
      onPressed: () {
        Navigator.pushReplacementNamed(screenContext, '/search');
      }
    );
  }

  static IconButton _buildThemeButtonIcon({
    icon, 
    onPressed
  }) {
    return IconButton(
      onPressed: onPressed, 
      icon: Icon(
        icon, 
        color: Colors.black, 
        size: 30
      )
    );
  }

  static IconButton _buildLeading(bool showBack, BuildContext screenContext, 
                                  GlobalKey<ScaffoldState> scaffoldKey) {
    if (showBack) {
      return _buildBackButton(screenContext);
    }
    
    return _buildMenu(scaffoldKey);
  }

  static IconButton _buildBackButton(BuildContext screenContext) {
    return _buildThemeButtonIcon(
      icon: Icons.arrow_back, 
      onPressed: () {
        Navigator.pop(screenContext);
      }
    );
  }

  static IconButton _buildMenu(GlobalKey<ScaffoldState> scaffoldKey) {
    return _buildThemeButtonIcon(
      icon: Icons.menu, 
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      }
    );
  }
}
