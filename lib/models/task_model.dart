class TaskModel {
  String _taskName;
  String _taskDescription;
  bool _taskConclusion;

  TaskModel({
    required String taskName,
    required String taskDescription,
    required bool taskConclusion,
  }) :
    _taskName = taskName,
    _taskDescription = taskDescription,
    _taskConclusion = taskConclusion;

  String get taskName => _taskName;
  String get taskDescription => _taskDescription;
  bool get taskConclusion => _taskConclusion;

  set taskName(String name){
    _taskName = name;
  }

  set taskDescription(String description){
    _taskDescription = description;
  }

  set taskConclusion(bool conclusion){
    _taskConclusion = conclusion;
  }

  void toggleConclusion(){
    _taskConclusion = !_taskConclusion;
  }

}
