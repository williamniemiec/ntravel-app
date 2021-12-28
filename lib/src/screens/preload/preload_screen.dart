import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ntravel/src/services/continent_service.dart';
import 'package:provider/provider.dart';
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
    AppData appdata = Provider.of<AppData>(context, listen: false);

    ContinentService continentService = ContinentService();
    var requestedData = await continentService.getContinents();

    if (requestedData != null) {
      appdata.setData(requestedData);
      success = true;
    }
    
    return success;
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
      body: _buildBody()
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
