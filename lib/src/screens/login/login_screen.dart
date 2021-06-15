import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:propotipo_escuela/src/screens/home/home_screen.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/';

  final formController = GlobalKey<FormState>();
  final tfemail = TextEditingController();
  final tfpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formController,
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _form(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _form() => Container(
        constraints: BoxConstraints(
          minWidth: 100,
          maxWidth: 400,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage(
                      'images/descarga.png',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                    controller: tfemail,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Ponga su correo';
                      if (!GetUtils.isEmail(v))
                        return 'De favor ponga un email valido';
                      return null;
                    }),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: tfpassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Ponga su contraseña' : null,
                ),
                SizedBox(height: 10.0),
                TextButton.icon(
                  onPressed: _login,
                  icon: Icon(Icons.login),
                  label: Text('ENTRAR'),
                )
              ],
            ),
          ),
        ),
      );

  void _login() {
    if (!formController.currentState!.validate())
      return Get.snackbar('Error', 'Cheque que los datos sean correctos');

    if (tfpassword.text.isEmpty)
      return Get.snackbar(
        'Error',
        'Deben ser más de 4 carácteres de contraseña',
      );
    GetStorage().write('login', true);
    Get.snackbar(
      'Logeo Correcto',
      'Cargando...',
      snackPosition: SnackPosition.BOTTOM,
    );
    Future.delayed(Duration(seconds: 2)).whenComplete(
      () => Get.offNamed(HomePage.route),
    );
  }
}
