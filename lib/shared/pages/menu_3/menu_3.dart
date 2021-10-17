import 'package:flutter/material.dart';

class Menu3Page extends StatelessWidget {
  const Menu3Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobCar'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Menu 3', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
