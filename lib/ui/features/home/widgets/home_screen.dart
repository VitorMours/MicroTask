import "package:flutter/material.dart";
import "package:todo_riverpod/ui/features/home/viewmodel/home_viewmodel.dart";

class HomePage extends StatefulWidget {

  const HomePage({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListenableBuilder(listenable: widget.viewModel, builder: (context, _)
        {


        }),
      ),
      bottomNavigationBar: BottomNavigationBar()

    );
  }
}
