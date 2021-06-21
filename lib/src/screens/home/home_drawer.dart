import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:propotipo_escuela/src/screens/login/login_screen.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            currentAccountPicture: GFAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
            ),
            otherAccountsPictures: <Widget>[
              Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                fit: BoxFit.cover,
              ),
              GFAvatar(
                child: Text("ab"),
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('user name'),
                Text('user@userid.com'),
              ],
            ),
          ),
          ListTile(
            title: Text('AJUSTES'),
            onTap: () {},
          ),
          ListTile(
            title: Text('CERRAR SESIÓN'),
            onTap: () {
              Get.defaultDialog(title: 'Confirmar cierre de sesión.', actions: [
                TextButton(
                  onPressed: () {
                    GetStorage().write('login', false);
                    Get.offAllNamed('/');
                  },
                  child: Text('CERRAR SESIÓN'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCELAR'),
                )
              ]);
            },
          ),
        ],
      ),
    );
  }

  Widget _listTile(
    String title, {
    IconData icon = Icons.account_circle_sharp,
    Function()? ontap,
  }) =>
      ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: ontap,
      );
}
