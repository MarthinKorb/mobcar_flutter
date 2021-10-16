import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/modules/cars/application/cars_service.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:provider/provider.dart';

class CarsProvider extends ChangeNotifier {
  static CarsProvider of(BuildContext context, {listen = true}) =>
      Provider.of<CarsProvider>(context, listen: listen);

  Future<List<Car>> get _data async =>
      await Modular.get<CarsService>().findAll();

  Future<List<Car>> getCars() async {
    return _data;
  }

  Future<Car> updateCar(Car car) async {
    final updatedCar = await Modular.get<CarsService>().update(car);
    notifyListeners();
    return updatedCar;
  }

  Future<Car> create(Car car) async {
    final newCar = await Modular.get<CarsService>().create(car);
    notifyListeners();
    return newCar;
  }

  Future<bool> delete(Car car) async {
    final deleted = await Modular.get<CarsService>().delete(car);
    notifyListeners();
    return deleted;
  }
}
