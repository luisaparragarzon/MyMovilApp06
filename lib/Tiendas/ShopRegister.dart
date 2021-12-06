import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopRegister extends StatefulWidget {
  @override
  ShopRegisterApp createState() => ShopRegisterApp();
}

class ShopRegisterApp extends State<ShopRegister> {
  @override
  TextEditingController nombreTienda = TextEditingController();
  TextEditingController rutaImagen = TextEditingController();
  TextEditingController descr_Tienda = TextEditingController();
  TextEditingController webSite = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registrar() async {
    try {
      await firebase.collection("Tiendas").doc().set({
        "nombreTienda": nombreTienda.text,
        "rutaImagen": rutaImagen.text,
        "descrip": descr_Tienda.text,
        "webSite": webSite.text
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de tiendas"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              //Nombre de la tienda
              child: TextField(
                controller: nombreTienda,
                decoration: InputDecoration(
                  labelText: "Nombre de la tienda",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite el nombre de la tienda",
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
                controller: rutaImagen,
                decoration: InputDecoration(
                  labelText: "Ruta de la imágen",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite la ruta de la imágen",
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
                controller: descr_Tienda,
                decoration: InputDecoration(
                  labelText: "Descripción de la tienda",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite la descripción de la tienda",
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
              // Página web
              child: TextField(
                controller: webSite,
                decoration: InputDecoration(
                  labelText: "Página web",
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Digite la página web de la tienda",
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
                    registrar();
                    nombreTienda.clear();
                    rutaImagen.clear();
                    descr_Tienda.clear();
                    webSite.clear();
                  },
                  child: Text("Registrar",
                      style: TextStyle(color: Colors.deepOrange)),
                )),
          ],
        ),
      ),
    );
  }
}
