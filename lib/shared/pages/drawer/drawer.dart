import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobicar_flutter/modules/initial_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int isSelected = 0;

  List<Widget> get drawerItems => [
        _buildDrawerItem(
            itemTitle: 'Home Page', isSelected: true, onTap: () => {}),
        _buildDrawerItem(
            itemTitle: 'Menu 2', isSelected: false, onTap: () => {}),
        _buildDrawerItem(
            itemTitle: 'Menu 3', isSelected: false, onTap: () => {}),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.only(left: 16, top: 16),
          child: const Text(
            'MobCar',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
        leadingWidth: 100,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_open_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InitialPage(key: widget.key),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...drawerItems,
              const Spacer(),
              SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('© ',
                        style: TextStyle(color: Colors.blue, fontSize: 22)),
                    Text(
                      ' 2020. All rights reserved to Mobcar.',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      {@required String itemTitle,
      @required bool isSelected,
      @required void Function() onTap}) {
    final _textStyle = TextStyle(
      color: isSelected ? Colors.blue : Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Text(itemTitle, style: _textStyle),
      ),
    );
  }
}
