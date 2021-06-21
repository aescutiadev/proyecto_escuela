import 'package:get/get.dart';
import 'package:propotipo_escuela/src/screens/areas/area_screen.dart';
import 'package:propotipo_escuela/src/screens/home/home_screen.dart';
import 'package:propotipo_escuela/src/screens/login/login_screen.dart';

routes() => [
      GetPage(name: '/', page: () => LoginPage()),
      GetPage(name: '/home', page: () => HomePage()),
      GetPage(name: '/home/:area', page: () => AreaScreen()),
    ];
