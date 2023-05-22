import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata_kita/auth/signIn_page.dart';
import 'package:pariwisata_kita/pages/home_pages.dart';
import 'package:pariwisata_kita/pages/pages_view_model.dart';
import 'package:provider/provider.dart';
import 'auth/auth_view_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthViewModel>(
        create: (context) => AuthViewModel(),
      ),
      ChangeNotifierProvider<PagesViewModel>(
        create: (context) => PagesViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, value, child) {
        return StreamBuilder<User?>(
          stream: value.auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Tampilkan widget loading jika masih dalam proses pengecekan status otentikasi
              return const CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                // Jika ada pengguna yang sudah login, tampilkan halaman beranda
                return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: HomePage(),
                );
              } else {
                // Jika tidak ada pengguna yang login, tampilkan halaman login
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: SignInPage(),
                );
              }
            }
          },
        );
      },
    );
  }
}
