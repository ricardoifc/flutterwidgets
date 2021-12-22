import 'package:flutter/material.dart';
import 'package:flutterwidgets/screen/home_screen.dart';
import 'package:flutterwidgets/screen/second_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Primer app con Flutter'),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: <String, WidgetBuilder>{
        "/productos" : (BuildContext context) => ListadoProductos(titulo: 'Listado de Productos'),
        "/inicio" : (BuildContext context) => HomeScreen(),
        'second': (_) => SecondScreen()
      },
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _name = "Ricardo";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //Aqui comeinza mi appbar

      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: (){},
          child: const Icon(
            Icons.menu
          ),
        ),

        actions: <Widget>[

          Padding(padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: const Icon(
                  Icons.search
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: const Icon(
                  Icons.more_vert
              ),
            ),
          )
        ]

      ),
      // fin appbar
      // Una Column
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch, //todo el ancho

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,// Centrado de todo Row
            crossAxisAlignment: CrossAxisAlignment.end, // End Hola COmo estas
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.cyan,
                child: Text("Inicio"),
              ),
              Text("Hola " ),
              Text("como "),
              Text("Estas $_name ?",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.red,
                child: Text("Fin"),
              ),
            ],
          ),

          //Containers
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.cyan,
            child: Text("texto 1"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.amberAccent,
            child: Text("texto 2"),
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            color: Colors.red,
            child: Text("texto 3"),
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            color: Colors.red,
            child: const Image(
              image: NetworkImage('https://www.pandaancha.mx/plds/articulos/4bf04095762666e2e6b288e55796834e585710389.jpg'),
              fit: BoxFit.fill,
            ),
          ),

// Boton
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,// Centrado de todo Row
            children: <Widget>[
              const SizedBox(height: 70),
              ElevatedButton(
                style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home_screen');
                  print('HelloWorld!');
                },
                child: const Text('Boton 1'),
              ),

              ElevatedButton(
                style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  print("Hola");
                  /*Navigator.of(context).pushNamed('/second_screen');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen()
                      )
                  );

                   */
                },

                child: const Text('Boton 2'),
              ),

            ],
          ),

        ],

        ),
      );
  }
}
