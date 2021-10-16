import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';

abstract class ICarsRepository {
  Future<Car> create(Car car);
  Future<Car> update(Car car);
  Future<bool> delete(Car car);
  Future<Car> findById({@required num id});
  Future<List<Car>> findAll();
}
