import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';

abstract class IModelRepository {
  Future<List<Model>> getModelsByIdBrand({@required codigoMarca});
}
