import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_model_repository.dart';

class ModelRepository implements IModelRepository {
  Dio _dio;

  ModelRepository({@required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<List<Model>> getModels({@required codigoMarca}) async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codigoMarca/modelos',
    );

    final mapData = response.data['modelos'];

    return Future.value(
      (mapData as List).map((map) => Model.fromMap(map)).toList(),
    );
  }

  @override
  Future<List<Model>> getYears() async {
    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos',
    );

    final mapData = response.data['anos'];

    return Future.value(
      (mapData as List).map((map) => Model.fromMap(map)).toList(),
    );
  }
}
