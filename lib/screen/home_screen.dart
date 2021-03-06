import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    //Botones
    final button1 = new ElevatedButton(
      child: Text("Listado de productos"),
      style: ElevatedButton.styleFrom(

          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
      ),

      onPressed: (){
        Navigator.pushNamed(context, "/listaproductos");
        print("Ir al home");
      },
      onLongPress: (){
        print("Long hello raiced button");
      },
    );


    final button2 = new ElevatedButton(
      child: Text("Segunda pantalla"),
      style: ElevatedButton.styleFrom(

        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),

      onPressed: (){
        Navigator.pushNamed(context, "/second");
        print("Ir al home");
      },
      onLongPress: (){
        print("Long hello raiced button");
      },
    );



    final button3 = new ElevatedButton(
      child: Text("Ir a clientes"),
      style: ElevatedButton.styleFrom(

        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),

      onPressed: (){
        Navigator.pushNamed(context, "/clientes");
        print("Ir al home");
      },
      onLongPress: (){
        print("Long hello raiced button");
      },
    );



    final button4 = new ElevatedButton(
      child: Text("Ir a splash"),
      style: ElevatedButton.styleFrom(

        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),

      onPressed: (){
        Navigator.pushNamed(context, "/splash");
        print("Ir al home");
      },
      onLongPress: (){
        print("Long hello raiced button");
      },
    );

    final button5 = new ElevatedButton(
      child: Text("Productos"),
      style: ElevatedButton.styleFrom(

        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),

      onPressed: (){
        Navigator.pushNamed(context, "/pruductos");
        print("Ir al home");
      },
      onLongPress: (){
        print("Long hello raiced button");
      },
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
              tooltip: 'Informaci??n del perfil',
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
              tooltip: 'Informaci??n del perfil',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Muestra la ubicaci??n')));
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
        ),
        body: Center(
          child:Container(
            child: Column(
              children: <Widget>[
                Text('Botonera'),
                Text('listado'),
                button1,
                Text('Ir a segunda pantalla'),
                button2,
                Text('Listado clientes'),
                button3,
                Text('ir a splash'),
                button4,
                Text('ir a productos(Examen Practico)'),
                button5
              ],
            ),
          ),
        )
    );
  }
}

class FichaProducto extends StatelessWidget{
  final String name;
  final String description;
  final int price;
  final String imagen;


  const FichaProducto({required this.name, required this.description, required this.price, required this.imagen}):super();

  @override
  Widget build(BuildContext context){
    //final ButtonStyle style =
    //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Card(

        child: Container(
          height: 150,
          child: Row(

            children: <Widget>[

              Image(

                image: NetworkImage('$imagen'),
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.description),
                    Text("Precio: "+this.price.toString())

                  ],
                ),
              )

            ],
          ),
        )
    );
  }
}
class ListadoProductos extends StatelessWidget{
  final String titulo;
  const ListadoProductos({required this.titulo}):super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titulo),
      ),
      body: ListView(
        children: <Widget>[
          FichaProducto(name: 'Lenovo 3', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://m.media-amazon.com/images/I/51ULYMCNInL._AC_SS450_.jpg'),
          FichaProducto(name: 'Lenovo 1', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://m.media-amazon.com/images/I/51ULYMCNInL._AC_SS450_.jpg'),
          FichaProducto(name: 'Lenovo 1', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://images-na.ssl-images-amazon.com/images/I/41S63IQRFXL._SX500_SY500_CR,0,0,500,500_.jpg'),
          FichaProducto(name: 'Lenovo 1', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7_v6jA66Xi_juUlGn-Qz8NSMCJqRhLK01Ng&usqp=CAU'),
          FichaProducto(name: 'Lenovo 1', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://m.media-amazon.com/images/I/51ULYMCNInL._AC_SS450_.jpg'),
          FichaProducto(name: 'Lenovo 1', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://m.media-amazon.com/images/I/51ULYMCNInL._AC_SS450_.jpg'),
          FichaProducto(name: 'Lenovo 1', description: 'I7 500 SSS, 8va Generacion', price: 1500, imagen: 'https://m.media-amazon.com/images/I/51ULYMCNInL._AC_SS450_.jpg')
        ],
      ),
    );
  }

}


class FichaCliente extends StatelessWidget{
  final String name2;
  final String direccion2;
  final String correo2;
  final String imagen2;


  const FichaCliente({required this.name2, required this.direccion2, required this.correo2, required this.imagen2}):super();

  @override
  Widget build(BuildContext context){
    //final ButtonStyle style =
    //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Card(

        child: Container(
          height: 150,
          child: Row(
            children: <Widget>[
              Image(
                image: NetworkImage('$imagen2'),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name2, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.direccion2),
                    Text(this.correo2)

                  ],
                ),
              )

            ],
          ),
        )
    );
  }
}
class ListadoClientes extends StatelessWidget{
  final String titulo;
  const ListadoClientes({required this.titulo}):super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titulo),
      ),
      body: ListView(
        children: <Widget>[
          FichaCliente(name2: 'Ricardo Freire', direccion2: 'Operadores', correo2: "ricardoifc@me.com", imagen2: 'https://pbs.twimg.com/profile_images/1105884155555008512/dJpDb1I__400x400.jpg'),
          FichaCliente(name2: 'juan', direccion2: 'centro', correo2: "test@hotmail.com", imagen2: 'https://image.freepik.com/vector-gratis/diseno-avatar-persona_24877-38137.jpg'),
          FichaCliente(name2: 'Pedro', direccion2: 'San Sebastian', correo2: "asdasd@asdasd.com", imagen2: 'https://previews.123rf.com/images/djvstock/djvstock1608/djvstock160807998/61244673-hombre-hombre-traje-avatar-persona-personas-icono-ilustraci%C3%B3n-aislada-y-plana-.jpg'),
          FichaCliente(name2: 'Diego', direccion2: 'El valle', correo2: "gasdg@fafg.com", imagen2: 'https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png'),


        ],
      ),
    );
  }

}