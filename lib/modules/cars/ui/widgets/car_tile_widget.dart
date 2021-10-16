import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/ui/utils/actions_utils.dart';
import 'package:mobicar_flutter/shared/constants.dart';
import 'popup_menu_button.dart';

class CarTileWidget extends StatelessWidget {
  final Car car;
  const CarTileWidget({
    @required this.car,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // leading: Image.network(carImage),
          leading: Image.asset(carImage),
          title: Text(
            car.modelo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(car.ano.toString()),
                  InkWell(
                    child: const Text(
                      'Ver Mais',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () =>
                        ActionsUtils.showCarDetailsDialog(context, car, key),
                  ),
                ],
              ),
              PopUpMenuButton(car, key: key),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
