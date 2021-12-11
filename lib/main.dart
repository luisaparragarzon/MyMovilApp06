import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'buscar.dart';
import 'Usuarios/GestionUsuario.dart';
import 'Tiendas/GestionTiendas.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

@override
class HomeStart extends State<Home> {
  TextEditingController busqueda = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación del grupo 01',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        cardColor: Colors.deepOrange,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
            title: Text('¡Bienvenido a la tienda del grupo 01!'),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (_) => ItemRegister(tiendaId.toString())));
                },
                tooltip: 'Agregar producto',
                child: const Icon(Icons.shopping_cart),
                //child: Text("add"),
                backgroundColor: Colors.deepOrange,
              )
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Búsqueda',
                      hintText: 'Palabra clave de la búsqueda'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    print("Presionado");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => buscar(busqueda.text)));
                  },
                  child: Text('Buscar'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GestionTiendas()));
                  },
                  child: Text('Gestionar la tienda'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    //print("Presionado");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GestionUsuario()));
                  },
                  child: Text('Gestión usuario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
