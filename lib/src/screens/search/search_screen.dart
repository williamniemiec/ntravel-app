import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/template/custom_app_bar.dart';
import 'package:ntravel/src/components/template/custom_drawer.dart';
import 'package:ntravel/src/screens/search/search_input.dart';
import 'package:ntravel/src/screens/search/search_results.dart';


/// Responsible for search cities.
class SearchScreen extends StatefulWidget {
  
  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const SearchScreen({Key? key}) : super(key: key);
  

  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  _SearchScreen createState() => _SearchScreen();
}


class _SearchScreen extends State<SearchScreen> {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final GlobalKey<ScaffoldState> _scaffoldKey;
  List<City> _searchList;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  _SearchScreen() : 
    _scaffoldKey = GlobalKey(),
    _searchList = [];


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context),
        body: _buildBody(context)
      )
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext screenContext) {
    LocalesConfig locale = LocalesConfig.of(screenContext)!;

    return CustomAppBar(
      title: locale.translate("SEARCH_A_CITY"),
      scaffoldKey: _scaffoldKey,
      screenContext: screenContext,
      hideSearch: true
    );
  }

  Widget _buildDrawer(BuildContext screenContext) {
    return CustomDrawer(
      screenContext: screenContext
    );
  }

  Column _buildBody(BuildContext screenContext) {
    return Column(
      children: [
        SearchInput(
          onChanged: (text) => _searchCity(screenContext, text)
        ),
        SearchResults(
          searchList: _searchList, 
          context: screenContext
        )
      ]
    );
  }

  /// Searches for cities with a name using [cityName].
  void _searchCity(BuildContext screenContext, String cityName) async {
    AppData appdata = Provider.of<AppData>(screenContext, listen: false);

    setState(() {
      _searchList = appdata.searchCity(cityName);
    });
  }
}
