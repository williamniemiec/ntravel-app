import 'package:flutter/material.dart';
import 'package:ntravel/locales/locales.dart';

Widget CustomDrawer({
  required BuildContext pageContext
}) {

  var locale = Locales.of(pageContext)!;

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'nTravel',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )
              ),
              Text(
                locale.translate("APP_DESCRIPTION"),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                )
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue
          ),
        ),
        ListTile(
          title: Text(locale.translate("HOME")),
          onTap: () { Navigator.pushNamed(pageContext, '/home'); },
          leading: Icon(Icons.home),
        ),
        ListTile(
          title: Text(locale.translate("SELECT_CONTINENT")),
          onTap: () { Navigator.pushNamed(pageContext, '/continent'); },
          leading: Icon(Icons.public),
        ),
        ListTile(
          title: Text(locale.translate("SEARCH_CITY")),
          onTap: () { Navigator.pushNamed(pageContext, '/search'); },
          leading: Icon(Icons.search),
        ),
        ListTile(
          title: Text(locale.translate("FAVORITES")),
          onTap: () { Navigator.pushNamed(pageContext, '/favorites'); },
          leading: Icon(Icons.favorite),
        ),
      ],
    ),
  );
}

