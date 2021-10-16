import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/ui/providers/cars_provider.dart';
import 'package:mobicar_flutter/modules/cars/ui/widgets/car_details_dialog_widget.dart';
import 'package:mobicar_flutter/modules/cars/ui/widgets/car_form_widget.dart';
import 'package:mobicar_flutter/modules/cars/ui/widgets/details_car_dialog.dart';
import 'package:mobicar_flutter/shared/widgets/buttons/button.dart';

class ActionsUtils {
  static void showCarDetailsDialog(BuildContext context, Car car, Key key) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsCarDialogWidget(
          child: CarDetailsDialogWidget(car: car),
          car: car,
          key: key,
        );
      },
    );
  }

  static void showCarFormDialog(BuildContext context,
      {@required Car car, bool isInsertMode = true, Key key}) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsCarDialogWidget(
          child: CarFormWidget(
            car: car,
            isInsertMode: isInsertMode,
          ),
          car: car,
          key: key,
        );
      },
    );
  }

  static void showDeleteCarConfirmationDialog(
    BuildContext context,
    Car car,
    Key key,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsCarDialogWidget(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Você deseja excluir o carro ${car.modelo}?'),
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Button(
                        text: 'Cancelar',
                        useBlackButton: false,
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 4),
                      Button(
                        text: 'Confirmar',
                        onTap: () {
                          _ondDeleteCar(context, car);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          car: car,
          key: key,
        );
      },
    );
  }

  static void _ondDeleteCar(BuildContext context, Car car) {
    CarsProvider.of(context, listen: false).delete(car);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${car.modelo} removido com sucesso}'),
      ),
    );
    Navigator.pop(context);
  }
}
