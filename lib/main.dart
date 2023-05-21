import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, value, child) {
        value.checkLogin();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: value.widgetNow,
        );
      },
    );
  }
}
