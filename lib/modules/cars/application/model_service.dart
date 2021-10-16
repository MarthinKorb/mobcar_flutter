import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_model_repository.dart';

class ModelService {
  IModelRepository _modelRepository;
  ModelService({@required IModelRepository modelRepository}) {
    _modelRepository = modelRepository;
  }

  Future<List<Model>> getModelsByIdBrand({@required codigoMarca}) async {
    final models = await _modelRepository.getModelsByIdBrand(
      codigoMarca: codigoMarca,
    );
    return models;
  }
}
