import 'package:flutter/material.dart';

class Menu2Page extends StatelessWidget {
  const Menu2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobCar'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Menu 2', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
