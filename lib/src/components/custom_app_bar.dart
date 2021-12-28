import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget? CustomAppBar({
  required GlobalKey<ScaffoldState> scaffoldKey,
  required BuildContext pageContext,
  String title = '',
  bool hideSearch = false,
  bool showBack = false,
}) {

  IconButton leadingButton = showBack ? Back(pageContext) : Menu(scaffoldKey);

  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.white,
    elevation: 0, // Remove bottom shadow
    centerTitle: false,
    title: Text(
      title, 
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      )
    ),
    actions: [
      hideSearch ? Container() : Search(pageContext)
    ],
    leading: leadingButton,
  );
}

IconButton Search(BuildContext pageContext) {

  return ThemeButtonIcon(
    icon: Icons.search, 
    onPressed: () {
      Navigator.pushReplacementNamed(pageContext, '/search');
    }
  );
}

IconButton ThemeButtonIcon({
  icon, onPressed
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

IconButton Menu(GlobalKey<ScaffoldState> scaffoldKey) {

  return ThemeButtonIcon(
    icon: Icons.menu, 
    onPressed: () {
      scaffoldKey.currentState!.openDrawer();
    }
  );
}

IconButton Back(BuildContext pageContext) {

  return ThemeButtonIcon(
    icon: Icons.arrow_back, 
    onPressed: () {
      Navigator.pop(pageContext);
    }
  );
}
