import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_year.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_car_year.dart';

class CarYearsRepositoryImpl implements ICarYearsRepository {
  Dio _dio;

  CarYearsRepositoryImpl({@required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<List<CarYear>> getCarYears(
      {@required num idBrand, @required num idModel}) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$idBrand/modelos/$idModel/anos',
    );
    final lista =
        (response.data as List).map((map) => CarYear.fromMap(map)).toList();
    return lista;
  }
}
