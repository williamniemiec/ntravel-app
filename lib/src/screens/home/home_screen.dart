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
        appBar: _buildAppBar(context, locale),
        backgroundColor: Colors.white,
        drawer: _buildDrawer(context),
        body: _buildBody(locale)
      )
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext screenContext, 
                                    LocalesConfig locale) {
    return CustomAppBar(
      title: locale.translate("BEGIN"),
      scaffoldKey: _scaffoldKey,
      pageContext: screenContext
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      pageContext: screenContext
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
