import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_year.dart';

abstract class ICarYearsRepository {
  Future<List<CarYear>> getCarYears({
    @required num idBrand,
    @required num idModel,
  });
}
