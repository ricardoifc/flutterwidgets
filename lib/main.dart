import 'package:flutter/material.dart';
import 'package:flutterwidgets/screen/home_screen.dart';
import 'package:flutterwidgets/screen/second_screen.dart';
import 'package:flutterwidgets/screen/clientes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: <String, WidgetBuilder>{
        "/productos" : (BuildContext context) => ListadoProductos(titulo: 'Listado de Productos'),
        "/inicio" : (BuildContext context) => HomeScreen(),
        "/clientes" : (BuildContext context)  => ListadoClientes(titulo: 'Listado de CLientes'),
        "/second": (_) => SecondScreen(),



      },
      //home: MyHomePage(title: 'Flutter Demo Home Page 1'),
    );
  }
}