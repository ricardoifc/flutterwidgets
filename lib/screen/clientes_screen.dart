import 'package:flutter/material.dart';
class ClientesScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final button2 = IconButton(
        icon: Icon(
          Icons.add_reaction,
          size: 20,
          color: Colors.red,
        ),
        tooltip:'Presioname',
        onPressed: (){
          Navigator.pop(context);
        }
    );

    return Scaffold(
        appBar: AppBar(
        title: const Text('Widgets Flutter'),
    actions: <Widget>[
    IconButton(
    icon: const Icon(
    Icons.person,
    color: Colors.tealAccent,
    size: 20.0,
    ),
    tooltip: 'Información del perfil',
    onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Muestra el perfil de usuario')));
    },
    ),
    IconButton(
    icon: const Icon(
    Icons.person_pin_circle_rounded,
    color: Colors.tealAccent,
    size: 20.0,
    ),
    tooltip: 'Información del perfil',
    onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Muestra la ubicación')));
    },
    ),
    IconButton(
    icon: const Icon(Icons.navigate_next),
    tooltip: 'Go to the next page',
    onPressed: () {
    Navigator.push(context, MaterialPageRoute<void>(
    builder: (BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text('Next page'),
    ),
    body: const Center(
    child: Text(
    'This is the next page',
    style: TextStyle(fontSize: 24),
    ),
    ),
    );
    },
    ));
    },
    ),
    ],
    )
    );
  }
}