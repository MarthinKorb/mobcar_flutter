import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_flutter/modules/cars/application/car_price_service.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/brand.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_price.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car_year.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/model.dart';
import 'package:mobicar_flutter/modules/cars/ui/providers/brands_models_provider.dart';
import 'package:mobicar_flutter/modules/cars/ui/providers/cars_provider.dart';
import 'package:mobicar_flutter/shared/constants.dart';
import 'package:mobicar_flutter/shared/widgets/buttons/button.dart';
import 'package:provider/provider.dart';

class CarFormWidget extends StatefulWidget {
  final Car car;
  final bool isInsertMode;

  const CarFormWidget({
    this.car,
    this.isInsertMode = true,
    Key key,
  }) : super(key: key);
  @override
  State<CarFormWidget> createState() => _CarFormWidgetState();
}

class _CarFormWidgetState extends State<CarFormWidget> {
  final _carPrice = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  void onFormSubmit(CarsProvider carsProvider, BuildContext context) {
    var actionMessage = '';
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (widget.isInsertMode) {
        carsProvider.create(widget.car);
        actionMessage = 'salvo';
      } else {
        carsProvider.updateCar(widget.car);
        actionMessage = 'atualizado';
      }
      actionMessage = _handleMessage(actionMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${widget.car.fabricante} ${widget.car.modelo} $actionMessage com sucesso.',
          ),
        ),
      );
      Navigator.pop(context);
    }
  }

  String _handleMessage(String actionMessage) {
    if (widget.isInsertMode) {
      actionMessage = 'salvo';
    } else {
      actionMessage = 'atualizado';
    }
    return actionMessage;
  }

  int _brandId;
  int _modelId;
  dynamic _carYear;

  @override
  Widget build(BuildContext context) {
    final _carsProvider = CarsProvider.of(context, listen: false);

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(paddingLG),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<BrandsModelsProvider>(
                  builder: (context, carsProvider, _) {
                    if (carsProvider.brands.isEmpty) {
                      carsProvider.getBrands();
                    }
                    return DropdownButtonFormField(
                      isExpanded: true,
                      hint: const Text('Marcas'),
                      items: carsProvider.brands.map((Brand brand) {
                        return DropdownMenuItem(
                          value: brand,
                          child: Text(
                            brand.nome,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (Brand marca) {
                        setState(() {
                          widget.car.fabricante = marca.nome;
                          carsProvider.models.clear();
                          _brandId = int.tryParse(marca.codigo);
                        });
                      },
                      decoration: inputDecoration(),
                    );
                  },
                ),
                const SizedBox(height: paddingLG),
                Consumer<BrandsModelsProvider>(
                  builder: (context, carsProvider, child) {
                    int _lastBrandCode;
                    if (carsProvider.models.isEmpty && _brandId != null ||
                        _lastBrandCode != _brandId) {
                      _lastBrandCode = _brandId;

                      carsProvider.getModelsByIdBrand(
                          codigoMarca: _brandId ?? 0);
                    }
                    return DropdownButtonFormField(
                      hint: const Text('Modelos'),
                      isExpanded: true,
                      items: carsProvider.models.map((Model model) {
                        return DropdownMenuItem(
                          value: model,
                          child: FittedBox(
                            child: Text(
                              model.nome,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (Model model) {
                        widget.car.modelo = model.nome;
                        _modelId = model.codigo;
                      },
                      decoration: inputDecoration(),
                    );
                  },
                ),
                const SizedBox(height: paddingLG),
                Consumer<BrandsModelsProvider>(
                  builder: (context, brandsModelsProvider, child) {
                    int _lastModelCode;
                    if (brandsModelsProvider.carYear.isEmpty &&
                            _modelId != null ||
                        _lastModelCode != _modelId) {
                      _lastModelCode = _modelId;

                      brandsModelsProvider.getCarYears(
                        idBrand: _brandId,
                        idModel: _modelId,
                      );
                    }
                    return DropdownButtonFormField(
                      hint: const Text('Anos'),
                      isExpanded: true,
                      items:
                          brandsModelsProvider.carYear.map((CarYear carYear) {
                        return DropdownMenuItem(
                          value: carYear,
                          child: FittedBox(
                            child: Text(
                              carYear.nome,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        );
                      }).toList(),
                      onSaved: (CarYear carYear) {
                        widget.car.ano = carYear.nome;
                        setState(() {
                          _carYear = carYear.codigo;
                        });
                      },
                      onChanged: (CarYear carYear) {
                        widget.car.ano = carYear.nome;
                        setState(() {
                          _carYear = carYear.codigo;
                        });
                      },
                      decoration: inputDecoration(),
                    );
                  },
                ),
                const SizedBox(height: paddingLG),
                FutureBuilder<CarPrice>(
                  future: _carYear == null
                      ? null
                      : Modular.get<CarPriceService>().getCarPrice(
                          idBrand: _brandId,
                          idModel: _modelId,
                          carYear: _carYear,
                        ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _carPrice.text = snapshot.data.valor;
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        margin: const EdgeInsets.all(12),
                        child: const CircularProgressIndicator(
                            color: Colors.black),
                      );
                    }
                    return TextFormField(
                      controller: _carPrice,
                      decoration: inputDecoration(hintText: 'Valor (R\$)'),
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      onSaved: (newValue) {
                        widget.car.valorFipe = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(paddingLG),
          child: Row(
            children: [
              const Spacer(),
              Button(
                text: 'Cancelar',
                useBlackButton: false,
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(width: 6),
              Button(
                text: 'Salvar',
                onTap: () => onFormSubmit(_carsProvider, context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration inputDecoration({String hintText = ''}) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.fromLTRB(10, 15, 5, 15),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
