import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_price.dart';

abstract class ICarPriceRepository {
  Future<CarPrice> getCarPrice({
    @required num idBrand,
    @required num idModel,
    @required dynamic carYear,
  });
}
