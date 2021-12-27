import 'package:ntravel/src/models/app_data.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderConfig {

  static final ProviderConfig _instance = ProviderConfig._internal();
  List<SingleChildWidget> _providers = [];
  
  factory ProviderConfig() {
    return _instance;
  }

  void _initializeProviders() {
    _providers = [
      ChangeNotifierProvider(
        create: (context) => AppData()
      )
    ];
  }

  ProviderConfig._internal() {
    _initializeProviders();
  }

  List<SingleChildWidget> get providers => _providers;
}
