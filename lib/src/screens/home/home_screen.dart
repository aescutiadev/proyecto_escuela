import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  HomePage({Key? key}) : super(key: key);

  final List items = ['Hola', 'MUNDO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profesores'),
      ),
      body: GridView.count(
        crossAxisCount: GetPlatform.isWeb ? 4 : 1,  
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
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Calidad Académica', icon: Icons.home),
  const Choice(title: 'Imagen', icon: Icons.image),
  const Choice(title: 'Clima organizacional', icon: Icons.perm_phone_msg),
  const Choice(title: 'Servicio de Apoyo', icon: Icons.help_outline_sharp),
  const Choice(
      title: 'Asuntos estudiantiles', icon: Icons.personal_injury_rounded),
  const Choice(title: 'Internalización', icon: Icons.airplanemode_on_rounded),
  const Choice(title: 'Finanzas', icon: Icons.monetization_on),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline4;
    return Card(
        color: Colors.orange,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child:
                        Icon(choice.icon, size: 50.0, color: textStyle!.color)),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}
