import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghaith_test/data/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _taskList = [];

  List<TaskModel> get taskList => _taskList;

  bool _isloading = true;
  bool get isloading => _isloading;

  Future<void> loadTasks() async {
    _isloading = !_isloading;
    notifyListeners();
    try {
      final String response = await rootBundle.loadString("assets/tasks.json");
      final List<dynamic> data = jsonDecode(response);
      _taskList = data.map((e) => TaskModel.fromJson(e)).toList();
    } catch (e) {
      print('Erreur de chargement des tâches: $e');
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }

  void toggleTaskCompletion(int id) {
    final index = _taskList.indexWhere((task) => task.id == id);
    if (index != -1) {
      _taskList[index].isCompleted = !_taskList[index].isCompleted;
      notifyListeners();
    }
  }

  void deleteTask(int id) {
    _taskList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void restoreTask(TaskModel task) {
    _taskList.add(task);
    notifyListeners();
  }
}
