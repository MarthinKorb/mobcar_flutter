import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';

class ViewCarDialogWidget extends StatelessWidget {
  final Widget child;
  final Car car;

  const ViewCarDialogWidget({@required this.child, @required this.car, Key key})
      : super(key: key);

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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.car_repair),
          const SizedBox(width: 8),
          Text(
            car.modelo ?? 'Novo Carro',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
