import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/ui/providers/cars_provider.dart';
import 'package:mobicar_flutter/modules/cars/ui/widgets/car_tile_widget.dart';
import 'package:provider/provider.dart';

class CarsListPage extends StatelessWidget {
  const CarsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Car>>(
      future: Provider.of<CarsProvider>(context).getCars(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return const Center(
              child: Text(
            'Nenhum carro cadastrado...',
            style: TextStyle(fontSize: 18),
          ));
        }
        final car = snapshot.data;
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return CarTileWidget(car: car[index]);
          },
        );
      },
    );
  }
}
