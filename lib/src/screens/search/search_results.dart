import 'package:flutter/material.dart';
import 'package:ntravel/src/components/citybox.dart';


/// Displays cities based on a list.
class SearchResults extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final List searchList;
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
            data: searchList[index], 
            onTap: () => _handleSelectCity(context, index)
          )
        )
      )
    );
  }

  /// Redirects to city page based on [selectedCity].
  void _handleSelectCity(BuildContext context, int selectedCity) {
    Navigator.of(context).pushNamed(
      '/city', 
      arguments: searchList[selectedCity]
    );
  }
}
