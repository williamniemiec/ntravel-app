import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/models/app_data.dart';
import 'package:ntravel/src/components/logo.dart';

class PreloadScreen extends StatefulWidget {

  @override
  _PreloadScreen createState() => _PreloadScreen();
}

class _PreloadScreen extends State<PreloadScreen> {

  bool loading = true;

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  void requestInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    bool successOnRequestData = await Provider.of<AppData>(context, listen: false).requestData();

    if (successOnRequestData) {
      Navigator.pushReplacementNamed(context, '/home');
    }
    else {
      setState(() {
        loading = false;
      });
    }
    
  }

  void reload() {
    print('again');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            loading ? Loading() : TryAgain(reload: reload)
          ],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Carregando informações...',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          margin: EdgeInsets.all(30),
        ),
        CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        )
      ],
    );
  }
}

class TryAgain extends StatelessWidget {

  final dynamic reload;

  TryAgain({
    required this.reload
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Tentar novamente'),
        onPressed: reload,
      ),
      margin: EdgeInsets.all(30),
    );
  }
}
