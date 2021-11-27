import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroUser extends StatefulWidget {
  @override
  RegistroUserApp createState() => RegistroUserApp();
}

class RegistroUserApp extends State<RegistroUser> {
  @override
  TextEditingController nombreUser = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController direccion = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registrarUsuario() async {
    try {
      await firebase.collection("Usuarios").doc().set({
        "nombreUsuario": nombreUser.text,
        "Correo": correo.text,
        "Teléfono": telefono.text,
        "Contraseña": pass.text,
        "DirecciÓn": direccion.text,
        "Estado": true
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de usuario"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              //Nombre del usuario
              child: TextField(
                controller: nombreUser,
                decoration: InputDecoration(
                  labelText: "Nombre del usuario",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite el nombre del usuario",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Ruta de la imagen
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  labelText: "Correo",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite el correo",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Descripción de la tienda
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                  labelText: "Teléfono",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite el teléfono",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // PÁGINA WEB
              child: TextField(
                obscureText: true,
                controller: direccion,
                decoration: InputDecoration(
                    labelText: "Dirección",
                    hintText: "Digite la dirección",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Página web
              child: TextField(
                obscureText: true, // Coloca puntos para ocultar las letras
                controller: pass,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite la contraseña",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
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
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    registrarUsuario();
                    nombreUser.clear();
                    correo.clear();
                    telefono.clear();
                    pass.clear();
                    direccion.clear();
                  },
                  child: Text("Registrar"),
                )),
          ],
        ),
      ),
    );
  }
}
