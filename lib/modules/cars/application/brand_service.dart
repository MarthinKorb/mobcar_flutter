import 'package:flutter/foundation.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/brand.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_brand_repository.dart';

class BrandService {
  IBrandRepository _brandRepository;

  BrandService({@required IBrandRepository brandRepository}) {
    _brandRepository = brandRepository;
  }

  Future<List<Brand>> getBrands() async {
    final brands = await _brandRepository.getBrands();
    return brands;
  }
}
