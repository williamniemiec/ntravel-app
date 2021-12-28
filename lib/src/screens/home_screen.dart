import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../components/logo.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';


class HomeScreen extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Permite q outros widgets usem scaffold

  TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    var locale = LocalesConfig.of(context)!;

    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title: locale.translate("BEGIN"),
          scaffoldKey: _scaffoldKey,
          pageContext: context
        ),
        backgroundColor: Colors.white,
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Bem vindo(a) ao',
                  style: textStyle,
                ),
                margin: EdgeInsets.only(bottom: 30),
              ),
              
              Logo(),
              Container(
                child: Text(
                  'Seu guia de viagem perfeito',
                  style: textStyle,
                ),
                margin: EdgeInsets.only(top: 30),
              )
            ],
          )
        )
      )
    );
  }
}
