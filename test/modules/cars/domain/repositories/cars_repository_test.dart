import 'package:flutter_test/flutter_test.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/domain/repositories/i_cars_repository.dart';
import 'package:mockito/mockito.dart';

class CarsRepositoryMock extends Mock implements ICarsRepository {}

void main() {
  ICarsRepository carsRepository;
  Car civic, city, uno;
  List<Car> cars;
  setUpAll(() {
    carsRepository = CarsRepositoryMock();
    civic = Car(
        id: 1,
        modelo: 'Civic',
        fabricante: 'Honda',
        ano: '2011',
        valorFipe: '45000');
    city = Car(
        id: 2,
        modelo: 'City',
        fabricante: 'Honda',
        ano: '2011',
        valorFipe: '38900');
    uno = Car(
        id: 3,
        modelo: 'Uno',
        fabricante: 'Fiat',
        ano: '2004',
        valorFipe: '7000');

    cars = [civic, city, uno];
  });
  group('Testes do CarsRepository =>', () {
    test('Deve ser possível criar um novo carro', () async {
      when(carsRepository.create(civic)).thenAnswer((_) async => civic);
      final createdCar = await carsRepository.create(civic);
      expect(createdCar, isA<Car>());
      expect(createdCar.modelo, equals('Civic'));
    });

    test('Deve ser possível atualizar um carro', () async {
      when(carsRepository.update(city))
          .thenAnswer((_) async => city..ano = '2012');
      final updatedCar = await carsRepository.update(city);

      expect(updatedCar.ano, equals('2012'));
    });

    test('Deve ser possível deletar um carro', () async {
      when(carsRepository.delete(uno)).thenAnswer((_) async => true);
      final idDeleted = await carsRepository.delete(uno);
      expect(idDeleted, isTrue);
    });
    test('Deve ser possível buscar um carro pelo id', () async {
      when(carsRepository.findById(id: civic.id))
          .thenAnswer((_) async => civic);
      final foundCar = await carsRepository.findById(id: civic.id);
      expect(foundCar.modelo, equals('Civic'));
    });
    test('Deve ser possível buscar todos os carros', () async {
      when(carsRepository.findAll()).thenAnswer((_) async => cars);
      final foundCars = await carsRepository.findAll();
      expect(foundCars, isA<List>());
      expect(foundCars.length, equals(3));
    });
  });
}
