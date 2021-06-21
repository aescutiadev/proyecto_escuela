import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget {
  final formController = GlobalKey<FormState>();
  final tfemail = TextEditingController();
  final tfpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/portada_temp.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Get.mediaQuery.orientation == Orientation.landscape
                  ? Expanded(
                    flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: Image(
                          width: 300.0,
                          height: 300.0,
                          image: AssetImage('images/descarga.png'),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                flex: 2,
                child: Form(
                  key: formController,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_form()],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() => Container(
        constraints: BoxConstraints(
          minWidth: 80,
          maxWidth: 380,
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
                ListTile(
                  title: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Get.mediaQuery.orientation == Orientation.landscape
                        ? Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )
                        : Image(
                            width: 200.0,
                            height: 200.0,
                            image: AssetImage('images/descarga.png'),
                          ),
                  ),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  title: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Correo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: TextFormField(
                    controller: tfemail,
                    decoration: InputDecoration(
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
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  title: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Contraseña',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: TextFormField(
                    controller: tfpassword,
                    decoration: InputDecoration(
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
                ),
                SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Colors.purple.shade700,
                        padding: EdgeInsets.all(18.0)),
                    onPressed: _login,
                    icon: Icon(Icons.login, color: Colors.white),
                    label: Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
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
      () => Get.offNamed('/home'),
    );
  }
}
