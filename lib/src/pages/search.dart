import 'package:ntravel/src/components/citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_data.dart';
import '../components/logo.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';

class SearchPage extends StatefulWidget {
  
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // Permite q outros widgets usem scaffold

  TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  var searchList = [];

  searchCity(pageContext, text) async {
    var searchResult = await Provider.of<AppData>(pageContext, listen: false).searchCity(text);

    setState(() {
      searchList = searchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title: 'Busque uma cidade',
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          hideSearch: true
        ),
        backgroundColor: Colors.white,
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  searchCity(context, text);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o nome de uma cidade',
                  suffixIcon: Icon(Icons.search, size: 32)
                ),
              ),
            ),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  searchList.length, 
                  (index) => CityBox(
                    data: searchList[index], 
                    onTap: (selectedCity) { Navigator.of(context).pushNamed('/city', arguments: selectedCity); }
                  )
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
