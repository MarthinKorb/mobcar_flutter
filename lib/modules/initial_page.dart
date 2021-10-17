import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mobicar_flutter/modules/cars/domain/models/car.dart';
import 'package:mobicar_flutter/shared/pages/drawer/drawer.dart';
import 'package:mobicar_flutter/shared/widgets/buttons/button.dart';
import 'cars/ui/pages/cars_list_page.dart';
import 'cars/ui/utils/actions_utils.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOBCAR'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_open_outlined),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerPage(key: widget.key),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                      child: Text(
                        'Olá, Fulano',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Veículos cadastrados',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Button(
                            text: 'Adicionar Novo',
                            onTap: () {
                              ActionsUtils.showCarFormDialog(
                                context,
                                key: widget.key,
                                car: Car(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Divider(color: Colors.black, height: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: CarsListPage(key: widget.key)),
          Container(
            height: 50,
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('© ', style: TextStyle(color: Colors.blue, fontSize: 22)),
                Text(
                  ' 2020. All rights reserved to Mobcar.',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
