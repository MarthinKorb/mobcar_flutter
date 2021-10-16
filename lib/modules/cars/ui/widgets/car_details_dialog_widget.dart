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
        _buildImageContainer(),
        Container(
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
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  car.modelo,
                  overflow: TextOverflow.fade,
                ),
              ),
              const Spacer(),
              Expanded(child: Text(car.valorFipe)),
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
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Image.asset(
        carImage,
      ),
    );
  }
}
