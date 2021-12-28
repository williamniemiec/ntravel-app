import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ntravel/src/models/app_data.dart';


/// Responsible for configuring application providers.
class ProviderConfig {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  static final ProviderConfig _instance = ProviderConfig._internal();
  late List<SingleChildWidget> _providers;
  

  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  ProviderConfig._internal() {
    _initializeProviders();
  }


  //---------------------------------------------------------------------------
  //		Factory
  //---------------------------------------------------------------------------
  factory ProviderConfig() {
    return _instance;
  }


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  void _initializeProviders() {
    _providers = [
      ChangeNotifierProvider(
        create: (context) => AppData()
      )
    ];
  }


  //---------------------------------------------------------------------------
  //		Getters
  //---------------------------------------------------------------------------
  List<SingleChildWidget> get providers => _providers;
}
