import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';


/// Responsible for displaying 'try again' option.
class TryAgain extends StatelessWidget {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final void Function() reload;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const TryAgain({Key? key, 
    required this.reload
  }) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    LocalesConfig locale = LocalesConfig.of(context)!;

    return Container(
      child: ElevatedButton(
        child: Text(locale.translate("TRY_AGAIN")),
        onPressed: reload,
      ),
      margin: const EdgeInsets.all(30),
    );
  }
}
