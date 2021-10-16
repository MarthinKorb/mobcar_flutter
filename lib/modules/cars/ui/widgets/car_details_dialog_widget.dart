import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/shared/constants.dart';
import 'package:mobicar_flutter/shared/widgets/buttons/button.dart';

class CarDetailsDialogWidget extends StatelessWidget {
  final Car car;
  const CarDetailsDialogWidget({@required this.car, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: _buildImageContainer()),
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(car.fabricante),
              const Spacer(),
              Text(car.ano.toString()),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(car.modelo),
              const Spacer(),
              Text('R\$ ${car.valorFipe}'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Expanded(
                child: Button(
                  text: 'Reservar',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildImageContainer() {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      // child: Image.network(carImage),
      child: Image.asset(carImage),
    );
  }
}
