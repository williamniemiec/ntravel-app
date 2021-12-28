import 'package:flutter/material.dart';
import 'package:ntravel/src/components/citybox.dart';
import 'package:ntravel/src/domain/city.dart';


/// Displays cities based on a list.
class SearchResults extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final List<City> searchList;
  final BuildContext context;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const SearchResults({
    Key? key,
    required this.searchList,
    required this.context,
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          searchList.length, 
          (index) => CityBox(
            city: searchList[index], 
            onTap: () => _handleSelectCity(context, index)
          )
        )
      )
    );
  }

  /// Redirects to city page based on [selectedCity].
  void _handleSelectCity(BuildContext screenContext, int selectedCity) {
    Navigator.of(screenContext).pushNamed(
      '/city', 
      arguments: searchList[selectedCity]
    );
  }
}
