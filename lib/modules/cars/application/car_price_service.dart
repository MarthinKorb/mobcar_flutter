import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_price.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_car_price_repository.dart';

class CarPriceService {
  ICarPriceRepository _carPriceRepository;
  CarPriceService({@required ICarPriceRepository carPriceRepository}) {
    _carPriceRepository = carPriceRepository;
  }

  Future<CarPrice> getCarPrice({
    @required num idBrand,
    @required num idModel,
    @required dynamic carYear,
  }) async {
    final carPrice = await _carPriceRepository.getCarPrice(
      idBrand: idBrand,
      idModel: idModel,
      carYear: carYear,
    );
    return carPrice;
  }
}
