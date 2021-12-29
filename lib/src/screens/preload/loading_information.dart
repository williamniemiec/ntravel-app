import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';


/// Responsible for displaying that information is being loaded.
class LoadingInformation extends StatelessWidget {
  
  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const LoadingInformation({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLoadingText(context),
        _buildLoadingIcon()
      ],
    );
  }

  Container _buildLoadingText(BuildContext context) {
    LocalesConfig locale = LocalesConfig.of(context)!;

    return Container(
      child: Text(
        locale.translate("LOADING_INFORMATION"),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white
        )
      ),
      margin: const EdgeInsets.all(30),
    );
  }

  CircularProgressIndicator _buildLoadingIcon() {
    return const CircularProgressIndicator(
      strokeWidth: 3,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF9000)),
    );
  }
}
