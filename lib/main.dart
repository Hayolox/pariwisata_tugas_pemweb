import 'package:flutter/material.dart';
import 'package:pariwisata_kita/auth/signIn_page.dart';
import 'package:pariwisata_kita/pages/add_pages.dart';
import 'package:pariwisata_kita/pages/detail_pages.dart';
import 'package:pariwisata_kita/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
