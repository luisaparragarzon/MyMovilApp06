import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Token.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();
  //final firebase= FirebaseFirestore.instance;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        //print("flag");
        print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          print(cursor.get("Correo") + "||" + correo.text);

          if (cursor.get("Correo") == correo.text) {
            print(cursor.get("Contraseña"));
            if (cursor.get("Contraseña") == pass.text) {
              // mensaje("Correcto", "¡Usuario correcto!");
              print(cursor.get("nombreUsuario"));
              flag = 1;
              Token tk = new Token();
              String idToken = await tk.validarToken("Login");
              if (idToken != 0) {
                final firebase = FirebaseFirestore.instance;
                try {
                  firebase.collection("Tokens").doc(idToken).delete();
                } catch (e) {
                  print(e);
                }
              }
              tk.guardarToken(cursor.id.toString());
              Navigator.of(context).pop();
            }
          }
        }
        if (flag == 0) {
          mensaje("No encontrado", "No se encontró el usuario");
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
        title: Text("Ingreso de clientes"),
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
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Correo",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite el correo electrónico",
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
              padding: EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Contraseña",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite su contraseña",
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
              padding: EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 50), primary: Colors.deepOrange),
                onPressed: () {
                  validarDatos();
                  // Para limpiar los datos ingresados
                  //correo.clear();
                  //pass.clear();
                },
                child: Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mensaje(String titulo, String mensaje) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Aceptar"),
              ),
            ],
          );
        });
  }
}
