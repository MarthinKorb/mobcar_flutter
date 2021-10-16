import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/modules/cars/application/brand_service.dart';
import 'package:mobicar_flutter/modules/cars/application/car_price_service.dart';
import 'package:mobicar_flutter/modules/cars/application/car_years_service.dart';
import 'package:mobicar_flutter/modules/cars/application/model_service.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/brand.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_price.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_year.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';

class BrandsModelsProvider extends ChangeNotifier {
  var _brands = <Brand>[];
  List<Brand> get brands => _brands;

  Future<List<Brand>> getBrands() async {
    final brands = await Modular.get<BrandService>().getBrands();
    _brands = brands;
    notifyListeners();

    return brands;
  }

  var _models = <Model>[];
  List<Model> get models => _models;

  Future<List<Model>> getModelsByIdBrand({@required codigoMarca}) async {
    final models = await Modular.get<ModelService>()
        .getModelsByIdBrand(codigoMarca: codigoMarca);
    _models = models;
    notifyListeners();
    return models;
  }

  var _carYear = <CarYear>[];

  List<CarYear> get carYear => _carYear;
  Future<List<CarYear>> getCarYears({
    @required num idBrand,
    @required num idModel,
  }) async {
    final result = await Modular.get<CarYearsService>()
        .getCarYears(idBrand: idBrand, idModel: idModel);
    _carYear = result;
    notifyListeners();
    return result;
  }

  CarPrice _carPrice = CarPrice(
    valor: 'R\$ 0,00',
  );
  CarPrice get carPrice => _carPrice;
  Future<CarPrice> getCarPrice({
    @required num idBrand,
    @required num idModel,
    @required String carYear,
  }) async {
    final response = await Modular.get<CarPriceService>()
        .getCarPrice(idBrand: idBrand, idModel: idModel, carYear: carYear);
    _carPrice = response;
    return response;
  }
}
