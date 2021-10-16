import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/container/app_module.dart';

import 'app_widget.dart';
import 'shared/database/sqflite_database_helper.dart';

void main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );

  DatabaseHelper.instance.database;
}
