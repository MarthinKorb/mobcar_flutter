import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/errors/errors.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_cars_repository.dart';
import 'package:mobicar_flutter/shared/database/sqflite_database_helper.dart';
import 'package:sqflite/sqflite.dart';

class CarsRepositoryImpl implements ICarsRepository {
  static const tableName = 'cars';
  static const carId = 'id';

  Future<Database> get _database async =>
      await DatabaseHelper.instance.database;
  @override
  Future<Car> create(Car car) async {
    try {
      final resp = await (await _database).insert(tableName, car.toMap());
      if (resp == 0) return Car();
      return car;
    } catch (e) {
      throw SQFLiteException(message: e.toString());
    }
  }

  @override
  Future<bool> delete(Car car) async {
    try {
      final result = await (await _database).delete(
        tableName,
        where: '$carId = ?',
        whereArgs: [car.id],
      );
      return result > 0;
    } catch (e) {
      throw SQFLiteException(message: e.toString());
    }
  }

  @override
  Future<Car> findById({@required num id}) async {
    try {
      final rows = await (await _database).query(
        tableName,
        where: '$carId = ?',
        whereArgs: [id],
      );
      return rows.map((e) => Car.fromMap(e)).first;
    } catch (e) {
      throw SQFLiteException(message: e.toString());
    }
  }

  @override
  Future<Car> update(Car car) async {
    try {
      final res = await (await _database).update(
        tableName,
        car.toMap(),
        where: '$carId = ?',
        whereArgs: [car.id],
      );
      if (res == 0) return Car();
      return await findById(id: car.id);
    } catch (e) {
      throw SQFLiteException(message: e.toString());
    }
  }

  @override
  Future<List<Car>> findAll() async {
    try {
      final rows = await (await _database).query(tableName);
      return rows.map((e) => Car.fromMap(e)).toList();
    } catch (e) {
      throw SQFLiteException(message: e.toString());
    }
  }
}
