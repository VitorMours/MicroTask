import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "../../../core/ui/bottom_navigation.dart";
import "../viewmodel/home_viewmodel.dart";
import "package:gap/gap.dart";
import "../../../../data/services/supabase_task_service.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? tableQuantity;
  var table;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchTasks();
    });
  }

  Future showBottomSheet(BuildContext dialogContext) {
    final viewModelState = Provider.of<HomeViewModel>(context, listen: false);
    return showModalBottomSheet(
      isScrollControlled: true,
      context: dialogContext,
      builder: (BuildContext innerContext) {
        return Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Text(
                          "Insira qual task vc pretende completar!",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Gap(12),
                      TextFormField(
                        decoration: InputDecoration(hintText: "nome"),
                        controller: viewModel.taskNameController,
                      ),
                      Gap(24),
                      TextFormField(
                        decoration: InputDecoration(hintText: "descricao"),
                        controller: viewModel.taskDescriptionController,
                      ),
                      Gap(24),
                      ElevatedButton(
                        child: Text("Criar task"),
                        onPressed: () => viewModel.createTask(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(title: Text("Micro Tasks"), centerTitle: true),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator(strokeWidth: 2));
          } else {
            return ListView.builder(
              itemCount: viewModel.taskList.length+1,
              itemBuilder: (BuildContext context, int index) {
                if (index == viewModel.taskList.length) {
                  return SizedBox(height: 40.0);
                } else {
                  final task = viewModel.taskList[index];
                  final taskName = task["name"] ?? "";
                  final taskDescription = task["description"] ?? "";
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.list),
                      title: Text(taskName),
                      subtitle: taskDescription.isNotEmpty
                          ? Text(
                              taskDescription,
                              style: TextStyle(color: Colors.grey),
                            )
                          : null,
                      trailing: Wrap(
                        children: [
                          Checkbox(
                            side: BorderSide(color: Colors.black, width: 2),
                            value: viewModel.taskList[index]["conclusion"],
                            onChanged: (bool? value) {
                              setState(() {
                                viewModel.toggleTaskConclusion(
                                  viewModel.taskList[index]["id"],
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
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
            showBottomSheet(context);
          },
          child: Icon(size: 30, color: Colors.white, Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
