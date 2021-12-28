import 'package:ntravel/src/components/citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../components/logo.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';

class FavoritesScreen extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Permite q outros widgets usem scaffold

  TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        List favorites = appdata.getFavorites();

        print(favorites);

        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            title: 'Cidades Salvas',
            scaffoldKey: _scaffoldKey,
            pageContext: context
          ),
          backgroundColor: Colors.white,
          drawer: CustomDrawer(
            pageContext: context
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              favorites.length, 
              (index) => CityBox(
                data: favorites[index], 
                onTap: (selectedCity) { Navigator.of(context).pushNamed("/city", arguments: selectedCity); }
              )
            )
          )
        );
      }
    );
  }
}
