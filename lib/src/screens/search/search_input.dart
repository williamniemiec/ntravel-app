import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';


/// Text input for searching cities.
class SearchInput extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final void Function(String)? onChanged;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const SearchInput({
    Key? key,
    required this.onChanged,
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    var locale = LocalesConfig.of(context)!;
    
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: locale.translate("ENTER_A_CITY_NAME"),
          suffixIcon: const Icon(Icons.search, size: 32)
        )
      )
    );
  }
}
