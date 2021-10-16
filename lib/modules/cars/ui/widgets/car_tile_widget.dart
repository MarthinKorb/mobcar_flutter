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
          leading: Image.asset(carImage),
          title: Text(
            car.modelo,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: PopUpMenuButton(car, key: key),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              Text(
                car.ano.toString(),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              InkWell(
                child: const Text(
                  'Ver Mais',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
                onTap: () =>
                    ActionsUtils.showCarDetailsDialog(context, car, key),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: paddinXL, right: paddinXL),
          child: const Divider(color: Colors.black),
        )
      ],
    );
  }
}
