import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_cars_repository.dart';

class CarsService {
  ICarsRepository _carsRepository;

  CarsService({@required ICarsRepository carsRepository}) {
    _carsRepository = carsRepository;
  }

  Future<Car> create(Car car) async {
    return await _carsRepository.create(car);
  }

  Future<Car> update(Car car) async {
    return await _carsRepository.update(car);
  }

  Future<bool> delete(Car car) async {
    return await _carsRepository.delete(car);
  }

  Future<Car> findById({@required num id}) async {
    return await _carsRepository.findById(id: id);
  }

  Future<List<Car>> findAll() async {
    return await _carsRepository.findAll();
  }
}
