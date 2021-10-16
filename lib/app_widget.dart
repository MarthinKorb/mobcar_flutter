import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/modules/cars/ui/providers/brands_models_provider.dart';
import 'package:provider/provider.dart';

import 'modules/cars/ui/providers/cars_provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarsProvider()),
        ChangeNotifierProvider(create: (_) => BrandsModelsProvider()),
      ],
      child: const MaterialApp(
        title: 'Mobicar',
        initialRoute: '/',
      ).modular(),
    );
  }
}
