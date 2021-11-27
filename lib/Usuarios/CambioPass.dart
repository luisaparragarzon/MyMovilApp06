import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CambioPass extends StatefulWidget {
  @override
  CambioPassApp createState() => CambioPassApp();
}

class CambioPassApp extends State<CambioPass> {
  TextEditingController correo = TextEditingController();
  TextEditingController passA = TextEditingController();
  TextEditingController passN = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        //print("flag");
        //print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          //print(cursor.get("Correo") + "||" + correo.text);
          if (cursor.get("Correo") == correo.text) {
            //print(cursor.get("Contraseña"));
            if (cursor.get("Contraseña") == passA.text) {
              //mensaje("Correcto","¡Usuario correcto!");
              //print(cursor.get("nombreUsuario"));
              flag = 1;
              try {
                await firebase.collection("Usuarios").doc(cursor.id).set({
                  "nombreUsuario": cursor.get("nombreUsuario"),
                  "correo": cursor.get("correo"),
                  "teléfono": cursor.get("telefono"),
                  "contraseña": passN.text,
                  "estado": true
                });
              } catch (e) {
                print(e);
              }
              //Navigator.push(
              // context, MaterialPageRoute(builder: (_) => buscar()));
            }
          }
        }
        if (flag == 0) {
          //mensaje("No encontrado","No se encontró el usuario");
        }
      } else {
        print("No hay elementos en la colección");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cambio de contraseña"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Container(
                width: 100,
                height: 100,
                child: Image.asset('images/login.png'),
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 50, right: 40, bottom: 0),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Correo",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite el correo",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 0),
              child: TextField(
                // Para que las contraseñas queden escondidas
                obscureText: true,
                controller: passA,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Contraseña actual",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite su contraseña actual",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 0),
              child: TextField(
                // Para que las contraseñas queden escondidas
                obscureText: true,
                controller: passN,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Contraseña nueva",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite su contraseña nueva",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  validarDatos();
                  // Para limpiar los datos ingresados
                  //correo.clear();
                  //pass.clear();
                },
                child:
                    Text("Cambiar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
