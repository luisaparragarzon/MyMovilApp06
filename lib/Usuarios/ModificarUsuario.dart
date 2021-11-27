import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModificarUsuario extends StatefulWidget {
  @override
  ModificarUsuarioApp createState() => ModificarUsuarioApp();
}

class ModificarUsuarioApp extends State<ModificarUsuario> {
  TextEditingController correo = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController direccion = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  String correo1 = "";
  String idDoc = "";
  String pass = "";
  bool estado = true;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get("Correo") == correo.text) {
            nombre.text = cursor.get("nombreUsuario");
            telefono.text = cursor.get("Teléfono");
            direccion.text = cursor.get("Dirección");
            this.idDoc = cursor.id;
            this.correo1 = cursor.get("Correo");
            this.pass = cursor.get("Contraseña");
          }
        }
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
      print(e);
    }
  }

  modificarDatos() async {
    try {
      await firebase.collection("Usuarios").doc(idDoc).set({
        "nombreUsuario": nombre.text,
        "Correo": this.correo1,
        "Teléfono": telefono.text,
        "Contraseña": pass,
        "Dirección": direccion.text,
        "Estado": estado
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar usuario"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Nombre del usuario
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  labelText: "Correo",
                  hintText: "Digite el correo electrónico",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    validarDatos();
                  },
                  child: Text("Buscar usuario"),
                )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Ruta de la imágen
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre del usuario",
                    hintText: "Digite el nombre del usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Descripción de la tienda
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                    labelText: "Teléfono",
                    hintText: "Digite el teléfono",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // Página web
              child: TextField(
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
              child: ElevatedButton(
                onPressed: () {
                  modificarDatos();
                  /* nombreUser.clear();
    Correo.clear();
    tele.clear();
    pass.clear();*/
                },
                child: Text("Modificar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
