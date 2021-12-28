import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/screens/home/home_text.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/logo.dart';
import 'package:ntravel/src/components/custom_app_bar.dart';
import 'package:ntravel/src/components/custom_drawer.dart';


/// Responsible for displaying Home screen.
class HomeScreen extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  HomeScreen({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    LocalesConfig locale = LocalesConfig.of(context)!;

    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(locale, context),
        backgroundColor: Colors.white,
        drawer: _buildDrawer(context),
        body: _buildBody(locale)
      )
    );
  }

  PreferredSizeWidget? _buildAppBar(LocalesConfig locale, BuildContext context) {
    return CustomAppBar(
      title: locale.translate("BEGIN"),
      scaffoldKey: _scaffoldKey,
      pageContext: context
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return CustomDrawer(
      pageContext: context
    );
  }

  Widget _buildBody(LocalesConfig locale) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeText(title: locale.translate("WELCOME_TO")),
          const Logo(),
          HomeText(title: locale.translate("PERFECT_TRAVEL_GUIDE"))
        ]
      )
    );
  }
}
