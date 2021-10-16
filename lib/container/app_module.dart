import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/modules/cars/infra/container/cars_binds.dart';
import 'package:mobicar_flutter/modules/initial_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<Dio>((i) => Dio()),
        ...carsBinds,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const InitialPage()),
      ];
}
