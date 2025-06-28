
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "../../../../data/repositories/task_repository.dart";
import "../../../../data/repositories/user_repository.dart";
import "../../../../models/task_model.dart";

class HomeViewModel extends ChangeNotifier {
  final ValueNotifier<bool> _showBottomSheetNotifier = ValueNotifier<bool>(
    false,
  );
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  int _taskQuantity = 0;
  List _taskList = [];

  HomeViewModel({required UserRepository userRepository})
    : _userRepository = userRepository;

  final UserRepository _userRepository;

  ValueNotifier<bool> get showBottomSheetNotifier => _showBottomSheetNotifier;

  int get taskQuantity => _taskQuantity;
  List get taskList => _taskList;

  set taskQuantity(int quantity) {
    _taskQuantity = quantity;
    notifyListeners();
  }
  set taskList(List list) {
    _taskList = list;
    notifyListeners();
  }

  void updateTaskNameController(String text) {
    taskNameController.text = text;
    notifyListeners();
  }

  void updateTaskDescriptionController(String text) {
    taskDescriptionController.text = text;
    notifyListeners();
  }

  void getTasks() {
    final future = Supabase.instance.client.from("tasks").select();
  }


  // TODO: Dentro dessa fun;'ao que devno aidicionar a nova task, e colocar ela dentro da lsita

  Future<void> createTask() async {
    taskQuantity += 1;
    var table = Supabase.instance.client.from("tasks");

    await table.insert({
      "name": taskNameController.text,
      "description": taskDescriptionController.text,
      "conclusion": false,
    });



    taskNameController.clear();
    taskDescriptionController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _showBottomSheetNotifier.dispose();
    super.dispose();
  }
}
