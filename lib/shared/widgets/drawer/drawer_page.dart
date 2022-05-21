import 'package:flutter/material.dart';
import 'package:mobicar_flutter/shared/pages/menu_2/menu_2.dart';
import 'package:mobicar_flutter/shared/pages/menu_3/menu_3.dart';
import 'package:mobicar_flutter/shared/widgets/drawer/mixins/navigation_helper.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> with NavigationHelper {
  var isHomePageSelected = true;
  var isMenu2Selected = false;
  var isMenu3Selected = false;

  List<Widget> get drawerItems => [
        _buildDrawerItem(
          itemTitle: 'Home Page',
          isSelected: isHomePageSelected,
          onTap: () {
            setState(() {
              isHomePageSelected = true;
              isMenu2Selected = false;
              isMenu3Selected = false;
            });
            Navigator.pop(context);
          },
        ),
        _buildDrawerItem(
          itemTitle: 'Menu 2',
          isSelected: isMenu2Selected,
          onTap: () {
            setState(() {
              isMenu2Selected = true;
              isHomePageSelected = false;
              isMenu3Selected = false;
            });
            Navigator.of(context).push(super.createRoute(const Menu2Page()));
          },
        ),
        _buildDrawerItem(
          itemTitle: 'Menu 3',
          isSelected: isMenu3Selected,
          onTap: () {
            setState(() {
              isMenu3Selected = true;
              isMenu2Selected = false;
              isHomePageSelected = false;
            });
            Navigator.of(context).push(super.createRoute(const Menu3Page()));
          },
        ),
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
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
        leadingWidth: 100,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_open_outlined),
            onPressed: () => Navigator.pop(context),
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
              ListView.builder(
                itemCount: drawerItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerRight,
                    child: drawerItems[index],
                  );
                },
              ),
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
