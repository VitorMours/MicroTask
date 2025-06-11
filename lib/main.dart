import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nested/nested.dart';
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

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(UserModel(email: "", password: "")),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(
            userRepository: UserRepository(),
            taskRepository: TaskRepository(),
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
        '/home': (context) => const HomePage(),
        '/signin': (context) => const SigninPage(),
      },
    );
  }
}
