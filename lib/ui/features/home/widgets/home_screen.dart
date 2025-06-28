import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "../../../core/ui/bottom_navigation.dart";
import "../viewmodel/home_viewmodel.dart";
import "package:gap/gap.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? tableQuantity;
  var table;
  @override
  void initState(){
    super.initState();
    getDatabase();
  }

  getDatabase() async {
    tableQuantity = await Supabase.instance.client.from("tasks").count();
    table = await Supabase.instance.client.from("tasks").select();
    final viewModelState = Provider.of<HomeViewModel>(context,listen: false);
    viewModelState.taskList = table;
    print(tableQuantity);
    print("oi");

  }



  Future showBottomSheet(BuildContext dialogContext) {
    final viewModelState = Provider.of<HomeViewModel>(context,listen: false);
    print(viewModelState.taskList);
    return showModalBottomSheet(
      context: dialogContext,
      builder: (BuildContext innerContext) {
        return Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
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
          return ListView.separated(
            itemCount: viewModel.taskQuantity,
            separatorBuilder: (_, _) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.list),
                title: Text(viewModel.taskList[index].name),
                trailing: Wrap(
                  children: [
                    Checkbox(
                      side: BorderSide(color: Colors.black, width: 2),
                      value: viewModel.taskList[index].conclusion,
                      onChanged: (bool? value) {
                        setState((){
                          viewModel.taskList[index].conclusion != value;
                        });
                      },
                    ),
                  ],
                ),
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
            showBottomSheet(context);
          },
          child: Icon(size: 30, color: Colors.white, Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
