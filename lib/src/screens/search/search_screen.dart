import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/custom_app_bar.dart';
import 'package:ntravel/src/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ntravel/src/screens/search/search_input.dart';
import 'package:ntravel/src/screens/search/search_results.dart';
import 'package:provider/provider.dart';


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
  List<dynamic> _searchList;


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

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    var locale = LocalesConfig.of(context)!;

    return CustomAppBar(
      title: locale.translate("SEARCH_A_CITY"),
      scaffoldKey: _scaffoldKey,
      pageContext: context,
      hideSearch: true
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return CustomDrawer(
      pageContext: context
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        SearchInput(
          onChanged: (text) => _searchCity(context, text)
        ),
        SearchResults(
          searchList: _searchList, 
          context: context
        )
      ]
    );
  }

  /// Searches for cities with a name using [cityName].
  void _searchCity(pageContext, cityName) async {
    AppData appdata = await Provider.of<AppData>(pageContext, listen: false);

    setState(() {
      _searchList = appdata.searchCity(cityName);
    });
  }
}
