import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/brand.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_brand_repository.dart';

class BrandRepository implements IBrandRepository {
  Dio _dio;

  BrandRepository({@required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<List<Brand>> getBrands() async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas',
    );
    return (response.data as List).map((row) => Brand.fromMap(row)).toList();
  }
}
