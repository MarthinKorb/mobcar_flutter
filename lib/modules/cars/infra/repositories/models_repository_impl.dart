import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_model_repository.dart';

class ModelRepositoryImpl implements IModelRepository {
  Dio _dio;

  ModelRepositoryImpl({@required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<List<Model>> getModelsByIdBrand({@required codigoMarca}) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codigoMarca/modelos',
    );

    final mapData = response.data['modelos'];

    return Future.value(
      (mapData as List).map((map) => Model.fromMap(map)).toList(),
    );
  }
}
