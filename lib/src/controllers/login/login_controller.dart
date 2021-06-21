import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class CustomForm extends GetView {
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Form(
      key: key,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            //onSaved: (value) => _.user.email = value,
            decoration: InputDecoration(labelText: 'Email'),
            enableSuggestions: true,
            maxLength: 32,
            style: TextStyle(fontSize: 20),
            validator: (value) {
              if (!isEmail(value!)) {
                return 'Insira um email válido';
              } else
                return null;
            },
          ),
          TextFormField(
              keyboardType: TextInputType.text,
              //onSaved: (value) => _.user.password = value,
              decoration: InputDecoration(labelText: 'Contraseña'),
              enableSuggestions: true,
              obscureText: true,
              maxLength: 20,
              style: TextStyle(fontSize: 20),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira uma senha';
                } else if (value.length < 5) {
                  return 'Insira uma senha maior';
                } else
                  return null;
              }),
          TextButton(
            onPressed: () {
              final form = key.currentState;
              form!.validate() ? form.save() : print('erro ao logar');
              // print(_.user.email);
              // print(_.user.password);
              // _.login();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}