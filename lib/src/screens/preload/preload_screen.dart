import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ntravel/src/components/template/background.dart';
import 'package:ntravel/src/services/storage_service.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/domain/continent.dart';
import 'package:ntravel/src/services/continent_service.dart';
import 'package:ntravel/src/screens/preload/loading_information.dart';
import 'package:ntravel/src/screens/preload/try_again.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/template/logo.dart';


/// Responsible for loading application data used by other screens.
class PreloadScreen extends StatefulWidget {
  
  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const PreloadScreen({Key? key}) : super(key: key);


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  _PreloadScreen createState() => _PreloadScreen();
}


class _PreloadScreen extends State<PreloadScreen> {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  bool loading = true;
  ContinentService? _continentService;
  StorageService? _storageService;


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    await _prepareRequest();
    
    bool successOnRequestData = await _requestData();
    
    if (successOnRequestData) {
      _successfulRequest();
    }
    else {
      _failedRequest();
    } 
  }

  Future<void> _prepareRequest() async {
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      loading = true;
    });
  }

  Future<bool> _requestData() async {
    bool success = false;
    _initializeServices();
    
    List<Continent> continents = await _continentService!.getContinents();

    if (continents.isNotEmpty) {
      _storageService!.setContinents(continents);
      success = true;
    }
    
    return success;
  }

  void _initializeServices() {
    AppData appdata = Provider.of<AppData>(context, listen: false);
    
    _storageService = StorageService(appdata);
    _continentService = ContinentService();
  }

  void _successfulRequest() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _failedRequest() {
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Background(
        body: _buildBody()
      )
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(),
          _buildStatus()
        ]
      )
    );
  }

  StatelessWidget _buildStatus() {
    if (loading) {
      return const LoadingInformation();
    }

    return TryAgain(reload: _loadData);
  }
}
