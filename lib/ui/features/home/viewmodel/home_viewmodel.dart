import "package:flutter/material.dart";
import "../../../../data/repositories/task_repository.dart";
import "../../../../data/repositories/user_repository.dart";
import "../../../../models/task_model.dart";

class HomeViewModel extends ChangeNotifier {

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  final int _taskQuantity = 1;

  HomeViewModel({
    required UserRepository userRepository,
    required TaskRepository taskRepository,
  }) : _userRepository = userRepository,
       _taskRepository = taskRepository;

  final UserRepository _userRepository;
  final TaskRepository _taskRepository;


  // TaskModel task
   addTask(){

    notifyListeners();
  }

  get taskQuantity => _taskQuantity;




  // TODO: Criar as funcoes que vao ser injetadas por meio do viewmodel
  void updateTaskNameController(){}
  void updateTaskDescriptionController(){}
  void submitTask(){}



}
