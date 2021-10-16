import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/shared/constants.dart';

class DetailsCarDialogWidget extends StatelessWidget {
  final Widget child;
  final Car car;

  const DetailsCarDialogWidget({
    @required this.child,
    @required this.car,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDialogHeader(context, car),
          child,
        ],
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context, Car car) {
    return Padding(
      padding: const EdgeInsets.all(paddingLG),
      child: Row(
        children: [
          const Icon(Icons.car_repair),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              car.modelo ?? 'Novo Carro',
              overflow: TextOverflow.fade,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
