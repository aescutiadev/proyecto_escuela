import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:propotipo_escuela/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      theme: Get.theme.copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 8.0,
          iconTheme: IconThemeData(),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black),
          ),
        ),
      ),
      initialRoute: box.read('login') == null || box.read('login') == false
          ? '/'
          : '/home',
      navigatorKey: Get.key,
      getPages: routes(),
    );
  }
}
