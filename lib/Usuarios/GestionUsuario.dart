import 'package:flutter/material.dart';
import 'RegistroUser.dart';
import 'Login.dart';
import 'CambioPass.dart';
import 'ModificarUsuario.dart';

class GestionUsuario extends StatefulWidget {
  @override
  GestionUsuarioApp createState() => GestionUsuarioApp();
}

class GestionUsuarioApp extends State<GestionUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestión de usuario"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 50), primary: Colors.deepOrange),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistroUser()));
                },
                child: Text("Registro de usuario"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 50), primary: Colors.deepOrange),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CambioPass()));
                },
                child: Text("Cambio de contraseña"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 50), primary: Colors.deepOrange),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (_) => BajaUsuario()));
                  mensaje("Inactivar usuario", "¿Desea inactivar el usuario?");
                },
                child: Text("Dar de baja"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 50), primary: Colors.deepOrange),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ModificarUsuario()));
                },
                child: Text("Modificar usuario"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(500, 50), primary: Colors.deepOrange),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: Text("Login"),
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
              Padding(
                padding:
                    EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                    hintText: "Digite el correo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                    EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                    hintText: "Digite la contraseña",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancelar", style: TextStyle(color: Colors.white)),
                color: Colors.deepOrange,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Aceptar", style: TextStyle(color: Colors.white)),
                color: Colors.deepOrange,
              ),
            ],
          );
        });
  }
}
