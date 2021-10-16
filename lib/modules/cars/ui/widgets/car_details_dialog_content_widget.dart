import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/ui/pages/image_page.dart';
import 'package:mobicar_flutter/shared/constants.dart';
import 'package:mobicar_flutter/shared/widgets/buttons/button.dart';

class CarDetailsDialogContentWidget extends StatelessWidget {
  final Car car;
  const CarDetailsDialogContentWidget({@required this.car, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImageContainer(context),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Marca',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(car.fabricante),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ano',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(car.ano.toString()),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Modelo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(car.modelo),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Valor',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(car.valorFipe),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(paddingLG),
          margin: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Expanded(
                child: Button(
                  text: 'Reservar',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.info_outlined, color: Colors.white),
                            SizedBox(width: 8),
                            Text('Reserva de veículo não implementada'),
                          ],
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageContainer(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImagePage(
            title: car.modelo, child: Image.asset(carImage), tag: car.id),
      )),
      child: carImageStack,
    );
  }

  Stack get carImageStack => Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Image.asset(carImage),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 25),
                Icon(Icons.star, color: Colors.amber, size: 25),
                Icon(Icons.star, color: Colors.amber, size: 25),
                Icon(Icons.star, color: Colors.amber, size: 25),
                Icon(Icons.star_border_outlined, color: Colors.amber, size: 25),
              ],
            ),
          ),
        ],
      );
}
