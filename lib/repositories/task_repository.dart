import "package:shared_preferences/shared_preferences.dart";

import "../models/task_model.dart";

class TaskRepository{

  late final SharedPreferences _prefs;
  final TaskModel _task;

  TaskRepository({required TaskModel task}) : _task = task;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  void saveInteger(){
    

  }

  void saveBoolean(){}

  void delete(){

  }

  void update(){

  }

  void get(){

  }

  void getById(){

  }
}