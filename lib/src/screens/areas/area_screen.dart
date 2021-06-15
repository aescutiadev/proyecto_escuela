import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class AreaScreen extends StatelessWidget {
  static const String route = '/home/area';
  const AreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var i = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(i.toString()),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            _view(i),
          ],
        ),
      ),
    );
  }

  Widget _view(String i) {
    switch (i) {
      case 'Calidad Académica':
        return _viewCalidadAcademica();
      case 'Imagen':
        return _viewImagen();
      case 'Clima organizacional':
        return _viewClimaOrganizacional();
      case 'Servicio de Apoyo':
        return _ft();
      case 'Asuntos estudiantiles':
        return _ft();
      case 'Internalización':
        return _ft();
      case 'Finanzas':
        return _ft();
      default:
        return Container();
    }
  }

  Widget _viewCalidadAcademica() => Column(
        children: [
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJES DE MAESTROS CON NIVEL ACADÉMICO',
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: GFProgressBar(
              padding: EdgeInsets.all(10.0),
              percentage: 0.8,
              lineHeight: 20,
              alignment: MainAxisAlignment.spaceBetween,
              child: const Text(
                '75%',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              leading:
                  Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
              trailing:
                  Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
              backgroundColor: Colors.black26,
              progressBarColor: GFColors.INFO,
            ),
          ),
          _acordeonGF(
            title: '% DE PROFESORES CON MAESTRIA EN SECUNDARIA',
            porcentajeT: 17.65,
            subtitle1: 'Número de profesores con maestria en secundaria',
            num1: 3.0,
            subtitle2: 'Total de profesores en secundaria',
            num2: 17.0,
          ),
          _acordeonGF(
            title: '% DE PROFESORES CON MAESTRIA EN PREPARATORIA',
            porcentajeT: 24.24,
            subtitle1: 'Número de profesores con maestria en preparatoria',
            num1: 3.0,
            subtitle2: 'Total de profesores en preparatoria',
            num2: 17.0,
          ),
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJES DE ALUMNOS CERTIFICADOS',
            ),
          ),
          _acordeonGF(
            title:
                '% DE ALUMNOS DE 3o DE SECUNDARIA CON PUNTAJE DE CENEVAL > 900',
            porcentajeT: 46.15,
            subtitle1:
                'Número de alumnos de 3o de secundaria con ceneval > 900',
            num1: 30.0,
            subtitle2:
                'Total de alumos de 3o de secundaria que presentaron examen',
            num2: 65.0,
          ),
          _acordeonGF(
            title:
                '% DE ALUMNOS DE 6o DE PREPARATORIA CON PUNTAJE DE CENEVAL > 900',
            porcentajeT: 46.15,
            subtitle1:
                'Número de alumnos de 6o de preparatoria con ceneval > 900',
            num1: 30.0,
            subtitle2:
                'Total de alumos de 6o de preparatoria que presentaron examen',
            num2: 52.0,
          ),
          _acordeonGF(
            title: '% DE ALUMNOS DE 3o DE SECUNDARIA QUE APROBARON EL DELF',
            porcentajeT: 100,
            subtitle1:
                'Número de alumnos de 3o de secundaria aprobados en DELF',
            num1: 30.0,
            subtitle2:
                'Total de alumos de 3o de secundaria que presentaron examen',
            num2: 65.0,
          ),
          _acordeonGF(
            title:
                '% DE ALUMNOS DE 6o DE PREPARATORIA CON PUNTAJE DE CENEVAL > 900',
            porcentajeT: 100,
            subtitle1:
                'Número de alumnos de 6o de preparatoria aprobados en DELF',
            num1: 4,
            subtitle2:
                'Total de alumos de 6o de preparatoria que presentaron examen',
            num2: 4,
          ),
          _acordeonGF(
            title: '% DE ALUMNOS DE P BATCH QUE APROBARON EL PET O FIRST',
            porcentajeT: 100,
            subtitle1: 'Número de alumnos aprobados en PET O FIRST',
            num1: 12.0,
            subtitle2:
                'Total de alumos de Bach de secundaria que presentaron examen',
            num2: 12.0,
          ),
          _acordeonGF(
            title:
                '% DE ALUMNOS DE PREPARATORIA QUE APROBARON EL ORGANIZACION INTERNACIONAL',
            porcentajeT: 44.44,
            subtitle1:
                'Número de alumnos de preparatoria aprobados en ORGANIZACION INTERNACIONAL',
            num1: 20,
            subtitle2: 'Total de alumos de preparatoria que presentaron examen',
            num2: 45,
          ),
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJE DE PROFESORES CERTIFICADOS POR PAI',
            ),
          ),
          _acordeonGF(
            title: '% DE PROFESORES CERTIFICADOS EN SECUNDARIA',
            porcentajeT: 54.94,
            subtitle1: 'Número de profesores certificados por PAI',
            num1: 9.0,
            subtitle2: 'Total de profesores en secundaria',
            num2: 17.0,
          ),
          Card(
            child: GFListTile(
              titleText:
                  'PORCENTAJE DE PROFESORES CERTIFICADOS POR ORGANIZACION INTERNACIONAL',
            ),
          ),
          _acordeonGF(
            title: '% DE PROFESORES CERTIFICADOS EN PREPARATORIA',
            porcentajeT: 54.94,
            subtitle1: 'Número de profesores certificados por PAI',
            num1: 18.0,
            subtitle2: 'Total de profesores en preparatoria',
            num2: 33.0,
          ),
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJE DE ALUMNOS EN SEGUIMIENTO',
            ),
          ),
          _acordeonGF(
            title: '% DE ALUMNOS EN SEGUIMIENTO DE SECUNDARIA',
            porcentajeT: 70.33,
            subtitle1: 'Número de alumnos en seguimiento en secundaria',
            num1: 128.0,
            subtitle2: 'Total de alumnos en preparatoria',
            num2: 182.0,
          ),
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJE DE PROFESORES QUE UTILIZAN LA TECNOLOGIA',
            ),
          ),
          _acordeonGF(
            title: '% DE PROFESORES DE SECUNDARIA',
            porcentajeT: 70.59,
            subtitle1: 'Número de profesores que la usan en secundaria',
            num1: 12.0,
            subtitle2: 'Total de profesores en secundaria',
            num2: 17.0,
          ),
          _acordeonGF(
            title: '% DE PROFESORES DE PREPARATORIA',
            porcentajeT: 70.59,
            subtitle1: 'Número de profesores que la usan en preparatoria',
            num1: 12.0,
            subtitle2: 'Total de profesores en preparatoria',
            num2: 17.0,
          ),
        ],
      );

  Widget _viewImagen() => Column(
        children: [
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJES DE ALUMNOS CERTIFICADOS',
            ),
          ),
          GFProgressBar(
            padding: EdgeInsets.all(10.0),
            percentage: 0.8,
            lineHeight: 20,
            alignment: MainAxisAlignment.spaceBetween,
            child: const Text(
              '75%',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            leading: Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
            trailing: Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
            backgroundColor: Colors.black26,
            progressBarColor: GFColors.INFO,
          ),
          _acordeonGF(
            title: '% DE PROFESORES CON MAESTRIA EN SECUNDARIA',
            porcentajeT: 17.65,
            subtitle1: 'Número de profesores con maestria en secundaria',
            num1: 3.0,
            subtitle2: 'Total de profesores en secundaria',
            num2: 17.0,
          ),
          _acordeonGF(
            title: '% DE PROFESORES CON MAESTRIA EN PREPARATORIA',
            porcentajeT: 24.24,
            subtitle1: 'Número de profesores con maestria en preparatoria',
            num1: 3.0,
            subtitle2: 'Total de profesores en preparatoria',
            num2: 17.0,
          ),
        ],
      );
  Widget _acordeonGF({
    String? title,
    double? porcentajeT,
    String? subtitle1,
    double? num1,
    String? subtitle2,
    double? num2,
  }) =>
      GFAccordion(
        showAccordion: true,
        expandedTitleBackgroundColor: Colors.white,
        titleChild: ListTile(
          title: Text(title!, style: TextStyle(fontSize: 13.0)),
          trailing: Text('$porcentajeT%'),
        ),
        contentChild: Column(
          children: [
            ListTile(
              title: Text(
                subtitle1!,
                style: TextStyle(fontSize: 12.0),
              ),
              trailing: Text('$num1'),
            ),
            ListTile(
              title: Text(
                subtitle2!,
                style: TextStyle(fontSize: 12.0),
              ),
              trailing: Text('$num2'),
            ),
          ],
        ),
        collapsedIcon: Icon(Icons.add),
        expandedIcon: Icon(Icons.minimize),
      );
  Widget _viewClimaOrganizacional() => Column(
        children: [
          Card(
            child: GFListTile(
              titleText: 'PORCENTAJES DE MAESTROS CON NIVEL ACADÉMICO',
            ),
          ),
          GFProgressBar(
            padding: EdgeInsets.all(10.0),
            percentage: 0.8,
            lineHeight: 20,
            alignment: MainAxisAlignment.spaceBetween,
            child: const Text(
              '75%',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            leading: Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
            trailing: Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
            backgroundColor: Colors.black26,
            progressBarColor: GFColors.INFO,
          ),
          GFAccordion(
            showAccordion: true,
            expandedTitleBackgroundColor: Colors.white,
            titleChild: ListTile(
              title: Text('% DE PROFESORES CON MAESTRIA EN SECUNDARIA'),
              trailing: Text('7.5'),
            ),
            contentChild: Column(
              children: [
                ListTile(
                  title: Text(
                    'Número de profesores con maestria en secundaria',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  trailing: Text('3'),
                ),
                ListTile(
                  title: Text(
                    'Total de profesores en secundaria',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  trailing: Text('17'),
                ),
              ],
            ),
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize),
          ),
          GFAccordion(
            showAccordion: true,
            expandedTitleBackgroundColor: Colors.white,
            titleChild: ListTile(
              title: Text('% DE PROFESORES CON MAESTRIA EN PREPARATORIA'),
              trailing: Text('7.5'),
            ),
            contentChild: Column(
              children: [
                ListTile(
                  title: Text(
                    'Número de profesores con maestria en preparatoria',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  trailing: Text('3'),
                ),
                ListTile(
                  title: Text(
                    'Total de profesores en preparatoria',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  trailing: Text('17'),
                ),
              ],
            ),
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize),
          ),
        ],
      );
  Widget _ft() => Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 400.0,
              minWidth: 200.0,
            ),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FixedColumnWidth(100.0),
                1: FlexColumnWidth(),
              },
              children: [
                TableRow(children: [
                  TableCell(child: Text('Numero 1: ')),
                  TableCell(child: _textfield()),
                ]),
                TableRow(children: [
                  TableCell(child: Text('Numero 2: ')),
                  TableCell(child: _textfield()),
                ]),
              ],
            ),
          ),
        ],
      );

  Widget _textfield() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
}
