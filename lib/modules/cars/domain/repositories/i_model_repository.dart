import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';

abstract class IModelRepository {
  Future<List<Model>> getModels({@required codigoMarca});
  Future<List<Model>> getYears();
}
