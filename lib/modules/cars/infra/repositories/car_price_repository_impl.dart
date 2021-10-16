import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_price.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_car_price_repository.dart';

class CarPriceRepositoryImpl implements ICarPriceRepository {
  Dio _dio;

  CarPriceRepositoryImpl({@required Dio dio}) {
    _dio = dio;
  }
  @override
  Future<CarPrice> getCarPrice({
    @required num idBrand,
    @required num idModel,
    @required dynamic carYear,
  }) async {
    final response = await _dio.get(
        'https://parallelum.com.br/fipe/api/v1/carros/marcas/$idBrand/modelos/$idModel/anos/$carYear');
    return CarPrice.fromMap(response.data);
  }
}
