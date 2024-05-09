import 'package:flutter/material.dart';
import 'package:login_screen_teste/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final altura = MediaQuery.of(context).size.height;
    //final largura = MediaQuery.of(context).size.width;
    //print('Tamanho: $largura x $altura');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const LoginPage(),
    );
  }
}