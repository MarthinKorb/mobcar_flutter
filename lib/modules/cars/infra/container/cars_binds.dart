import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/modules/cars/application/brand_service.dart';
import 'package:mobicar_flutter/modules/cars/application/car_price_service.dart';
import 'package:mobicar_flutter/modules/cars/application/car_years_service.dart';
import 'package:mobicar_flutter/modules/cars/application/cars_service.dart';
import 'package:mobicar_flutter/modules/cars/application/model_service.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_brand_repository.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_car_price_repository.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_car_year.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_cars_repository.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_model_repository.dart';
import 'package:mobicar_flutter/modules/cars/infra/repositories/brand_repository_impl.dart';
import 'package:mobicar_flutter/modules/cars/infra/repositories/car_price_repository_impl.dart';
import 'package:mobicar_flutter/modules/cars/infra/repositories/car_years_repository_impl.dart';
import 'package:mobicar_flutter/modules/cars/infra/repositories/cars_repository_impl.dart';
import 'package:mobicar_flutter/modules/cars/infra/repositories/models_repository_impl.dart';

/// Lista de Instâncias do módulo [Cars]
List<Bind> get carsBinds => [
      Bind.lazySingleton<ICarsRepository>(
        (i) => CarsRepositoryImpl(),
      ),
      Bind.lazySingleton<CarsService>(
        (i) => CarsService(carsRepository: i()),
      ),
      Bind.lazySingleton<IBrandRepository>(
        (i) => BrandRepositoryImpl(dio: i()),
      ),
      Bind.lazySingleton<BrandService>(
          (i) => BrandService(brandRepository: i())),
      Bind.lazySingleton<IModelRepository>(
          (i) => ModelRepositoryImpl(dio: i())),
      Bind.lazySingleton<ModelService>(
        (i) => ModelService(modelRepository: i()),
      ),
      Bind.lazySingleton<ICarYearsRepository>(
        (i) => CarYearsRepositoryImpl(dio: i()),
      ),
      Bind.lazySingleton<CarYearsService>(
        (i) => CarYearsService(carYearsRepository: i()),
      ),
      Bind.lazySingleton<ICarPriceRepository>(
        (i) => CarPriceRepositoryImpl(dio: i()),
      ),
      Bind.lazySingleton<CarPriceService>(
        (i) => CarPriceService(carPriceRepository: i()),
      ),
    ];
