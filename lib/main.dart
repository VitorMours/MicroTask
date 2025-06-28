import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nested/nested.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_riverpod/ui/features/%20login/viewmodel/login_viewmodel.dart';
import 'package:todo_riverpod/ui/features/%20login/widgets/login_page.dart';
import 'package:todo_riverpod/ui/features/home/widgets/home_screen.dart';
import 'data/models/user.dart';
import 'data/repositories/task_repository.dart';
import 'data/repositories/user_repository.dart';
import 'pages/signin_page.dart';
import "package:provider/provider.dart";

import 'ui/core/theme/theme.dart';
import 'ui/features/home/viewmodel/home_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: "https://jnzwyumbljcccsyhoasr.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impuend5dW1ibGpjY2NzeWhvYXNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc3ODE0MDMsImV4cCI6MjA2MzM1NzQwM30.a9jvty8Nu08AkWESfJetHFibsiS8XGOv-5NpNkpu9V0");

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(UserModel(email: "", password: "")),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(
            userRepository: UserRepository(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOist',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) =>HomePage(),
        '/signin': (context) => const SigninPage(),
      },
    );
  }
}
