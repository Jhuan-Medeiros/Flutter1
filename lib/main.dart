import 'package:flutter/material.dart';
import 'package:streaming/pages/cadastro.dart';
import 'package:streaming/pages/home.dart';
import 'package:streaming/pages/login.dart';
import 'package:streaming/pages/splash.dart';
import 'package:streaming/shared/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: myFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: myColors.azulEscuro),
        useMaterial3: true
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Splash(),
        "/Login": (context) => const Login(),
        "/Cadastro": (context) => const Cadastro(),
        "/Home":(context) => const Home()
      },
    );
  }
}