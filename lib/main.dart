import 'package:flutter/material.dart';
import 'package:flutterwidgets/screen/home_screen.dart';
import 'package:flutterwidgets/screen/second_screen.dart';
import 'package:flutterwidgets/screen/productos_screen.dart';
import 'package:flutterwidgets/screen/clientes_screen.dart';
import 'package:flutterwidgets/screen/splash.dart';


void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      routes: <String, WidgetBuilder>{
        "/listaproductos": (BuildContext context) =>
            ListadoProductos(titulo: 'Listado de Productos'),
        "/splash": (BuildContext context) => Splash(),
        "/inicio" : (BuildContext context) => HomeScreen(),
        "/clientes" : (BuildContext context)  => ListadoClientes(titulo: 'Listado de CLientes'),
        "/second": (_) => SecondScreen(),
        "/pruductos": (_) => ProductsPage(),





      },


      //home: MyHomePage(title: 'Flutter Demo Home Page 1'),
    );
  }
}