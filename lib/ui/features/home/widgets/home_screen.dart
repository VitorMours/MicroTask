import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../../core/ui/bottom_navigation.dart";
import "../viewmodel/home_viewmodel.dart";
import "";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(title: Text("Micro Tasks"), centerTitle: true),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.taskQuantity,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.list),
                title: Text("Criando um texto"),
                trailing: Wrap(
                  children: [
                    Checkbox(
                        side: BorderSide(color: Colors.black, width: 2),
                        value: false, onChanged: (bool) {})
                  ],
                ),
              );
              return ListTile(
                leading: Icon(Icons.list),
                title: Text("Criando um texto"),
              );
            },
          );
        },
      ),
      //       bottomNavigationBar: BottomNavigation()
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          tooltip: "Adicionar Task",
          shape: CircleBorder(),
          onPressed: () {
            context.read<HomeViewModel>().addTask();
          },
          child: Icon(size: 30, color: Colors.white, Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
