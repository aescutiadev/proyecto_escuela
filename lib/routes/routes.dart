import 'package:get/get.dart';
import 'package:propotipo_escuela/src/screens/home/home_screen.dart';
import 'package:propotipo_escuela/src/screens/login/login_screen.dart';

routes() => [
      GetPage(name: LoginPage.route, page: () => LoginPage()),
      GetPage(name: HomePage.route, page: () => HomePage()),
    ];
