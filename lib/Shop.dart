import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  ShopApp createState() => ShopApp();
}

class ShopApp extends State<Shop> {
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'FOOD TRUCK: Comidas rápidas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Perros calientes, hamburguesas, pizzas y mucho más...',
                  style: TextStyle(
                    color: Colors.deepOrange[500],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Image.asset('image/crapidas.png'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Entrar'))
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tiendas'),
      ),
      body: ListView(
        children: [titleSection, titleSection],
      ),
    );
  }
}
