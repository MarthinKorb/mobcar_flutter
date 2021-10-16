import 'package:mobicar_flutter/modules/cars/domain/models/brand.dart';

abstract class IBrandRepository {
  Future<List<Brand>> getBrands();
}
