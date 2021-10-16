import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_year.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_car_year.dart';

class CarYearsService {
  ICarYearsRepository _carYearsRepository;
  CarYearsService({@required ICarYearsRepository carYearsRepository}) {
    _carYearsRepository = carYearsRepository;
  }

  Future<List<CarYear>> getCarYears({
    @required num idBrand,
    @required num idModel,
  }) async {
    final result = await _carYearsRepository.getCarYears(
      idBrand: idBrand,
      idModel: idModel,
    );
    return result;
  }
}
