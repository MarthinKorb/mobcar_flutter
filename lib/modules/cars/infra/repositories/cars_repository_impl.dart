import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_cars_repository.dart';
import 'package:mobicar_flutter/shared/database/sqflite_database_helper.dart';
import 'package:sqflite/sqflite.dart';

class CarsRepositoryImpl implements ICarsRepository {
  static const tableName = 'cars';
  static const carId = 'id';
  @override
  Future<Car> create(Car car) async {
    Database database = await DatabaseHelper.instance.database;
    try {
      final resp = await database.insert(tableName, car.toMap());
      if (resp == 0) return Car();
      return car;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> delete(Car car) async {
    Database db = await DatabaseHelper.instance.database;
    final result = await db.delete(
      tableName,
      where: '$carId = ?',
      whereArgs: [car.id],
    );

    return result > 0;
  }

  @override
  Future<Car> findById({@required num id}) async {
    Database database = await DatabaseHelper.instance.database;
    final rows = await database.query(
      tableName,
      where: '$carId = ?',
      whereArgs: [id],
    );
    return rows.map((e) => Car.fromMap(e)).first;
  }

  @override
  Future<Car> update(Car car) async {
    Database database = await DatabaseHelper.instance.database;
    final res = await database.update(
      tableName,
      car.toMap(),
      where: '$carId = ?',
      whereArgs: [car.id],
    );
    if (res == 0) return Car();

    return await findById(id: car.id);
  }

  @override
  Future<List<Car>> findAll() async {
    Database database = await DatabaseHelper.instance.database;
    final rows = await database.query(tableName);
    return rows.map((e) => Car.fromMap(e)).toList();
  }
}
