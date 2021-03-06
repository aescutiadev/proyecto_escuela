import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propotipo_escuela/src/screens/areas/area_screen.dart';
import 'package:propotipo_escuela/src/screens/home/home_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List items = ['Hola', 'MUNDO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text('GENERAL'),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(15.0),
        crossAxisCount:
            Get.mediaQuery.orientation == Orientation.landscape ? 4 : 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(
          choices.length,
          (index) {
            return Center(
              child: SelectCard(choice: choices[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _card() => Container(
        constraints: BoxConstraints(
          maxWidth: 450.0,
          minWidth: 200.0,
        ),
        child: Placeholder(),
      );
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}

class Choice {
  const Choice({required this.title, required this.icon, required this.onTap});
  final String title;
  final IconData icon;
  final void Function() onTap;
}

const List<Choice> choices = const <Choice>[
  const Choice(
    title: 'Bachillerato',
    icon: Icons.home,
    onTap: _hola,
  ),
  const Choice(
    title: 'Primaria',
    icon: Icons.image,
    onTap: _hola2,
  ),
  const Choice(
    title: 'Kinder',
    icon: Icons.perm_phone_msg,
    onTap: _hola3,
  ),
  const Choice(
    title: 'Administrativo',
    icon: Icons.help_outline_sharp,
    onTap: _hola4,
  ),
  const Choice(
    title: 'Psicopedagogía',
    icon: Icons.personal_injury_rounded,
    onTap: _hola5,
  ),
  const Choice(
    title: 'Informática',
    icon: Icons.airplanemode_on_rounded,
    onTap: _hola6,
  ),
  const Choice(
    title: 'Deportes',
    icon: Icons.monetization_on,
    onTap: _hola7,
  ),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return InkWell(
      onTap: choice.onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(choice.icon, size: 50.0, color: textStyle!.color),
              ),
              Text(choice.title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}

void _hola() {
  var parameters = <String, String> {'type': 'Calidad Académica'};
  Get.toNamed('/home/1', parameters: parameters);
}

void _hola2() {
  var parameters = <String, String> {'type': 'Imagen'};
  Get.toNamed('/home/2', parameters: parameters);
}

void _hola3() {
  var parameters = <String, String>{'type': 'Colima organizacional'};
  Get.toNamed('/home/3', parameters: parameters);
}

void _hola4() {
  var parameters = <String, String> {'type': 'Servicio de Apoyo'};
  Get.toNamed('/home/4', parameters: parameters);
}

void _hola5() {
  var parameters = <String, String> {'type': 'Asuntos estudiantiles'};
  Get.toNamed('/home/5', parameters: parameters);
}

void _hola6() {
  var parameters = {'type': 'Internalización'};
  Get.toNamed('/home/6', parameters: parameters);
}

void _hola7() {
  var parameters = {'type': 'Finanzas'};
  Get.toNamed('/home/7', parameters: parameters);
}
