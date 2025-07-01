
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "../../../../data/repositories/task_repository.dart";
import "../../../../data/repositories/user_repository.dart";
import "../../../../data/services/supabase_task_service.dart";
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
  set TaskNameController(String text) {
    taskNameController.text = text;
    notifyListeners();
  }
  set TaskDescriptionController(String text) {
    taskDescriptionController.text = text;
    notifyListeners();
  }


  Future<List> fetchTasks() async {
    List tasks = await SupabaseTaskService.getTasks();
    taskList = tasks;
    return tasks;
  }


  Future<void> createTask() async {
    var table = Supabase.instance.client.from("tasks");

    await table.insert({
      "name": taskNameController.text,
      "description": taskDescriptionController.text,
      "conclusion": false,
    });

    // Recarrega a lista com as tasks atualizadas
    final response = await table.select();

    taskList = response; // <-- dispara o notifyListeners()
    taskNameController.clear();
    taskDescriptionController.clear();
  }

  void toggleTaskConclusion(int id){
    // TODO: Preciso fazer com que a task fique trocando a partir do momento em qe clico na checkbox
  }

  @override
  void dispose() {
    _showBottomSheetNotifier.dispose();
    super.dispose();
  }
}
