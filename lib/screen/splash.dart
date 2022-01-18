import 'package:flutter/material.dart';
import 'package:flutterwidgets/main.dart';

class Splash extends StatefulWidget{
  const Splash({Key? Key }): super(key: Key);

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash>{
  @override
  void initState(){
    super.initState();
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome () async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, width: 100,
              child: const Image(
                image: NetworkImage('https://i.ibb.co/1bQsG9B/logo-xd-preview-rev-2.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Text(
                  'cargando productos...'
              ),
            )
          ],
        ),
      ),
    );
  }
}