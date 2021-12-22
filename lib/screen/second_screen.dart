import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final button2 = IconButton(
        icon: Icon(
          Icons.add_reaction,
          size: 20,
          color: Colors.lightGreen,
        ),
        tooltip:'Presioname',
        onPressed: (){
          Navigator.pop(context);
        }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('Segunda Pantalla'),
                button2
              ],
            ),
          )
      ),
    );
  }
}