import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nested/nested.dart';
import 'package:todo_riverpod/ui/features/%20login/viewmodel/login_viewmodel.dart';
import 'data/models/user.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/signin_page.dart';
import "package:provider/provider.dart";

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(UserModel(email: null, password: null)),
        ),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOist',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/signin': (context) => const SigninPage(),
      },
    );
  }
}
