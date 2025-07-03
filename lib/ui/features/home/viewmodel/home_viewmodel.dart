
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
  bool _isLoading = true;

  HomeViewModel({required UserRepository userRepository})
    : _userRepository = userRepository;

  final UserRepository _userRepository;

  ValueNotifier<bool> get showBottomSheetNotifier => _showBottomSheetNotifier;
  int get taskQuantity => _taskQuantity;
  List get taskList => _taskList;
  bool get isLoading => _isLoading;

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
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }


  Future<List> fetchTasks() async {
    _isLoading = true;
    List tasks = await SupabaseTaskService.getTasks();
    taskList = tasks;
    _isLoading = false;
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

  Future<void> toggleTaskConclusion(int id, int index) async {
    final currentTask = _taskList[index];
    final previousValue = currentTask["conclusion"];
    final newValue = !previousValue;

    _taskList[index]["conclusion"] = newValue;
    notifyListeners();

    try {
      final table = Supabase.instance.client.from("tasks");
      await table.update({"conclusion": newValue}).eq("id", id);
    } catch (e) {
      _taskList[index]["conclusion"] = previousValue;
      notifyListeners();
      debugPrint("Erro ao atualizar task: $e");
    }
  }

  @override
  void dispose() {
    _showBottomSheetNotifier.dispose();
    super.dispose();
  }
}
