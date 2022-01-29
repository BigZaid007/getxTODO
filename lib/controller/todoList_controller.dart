import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newnote/model/todolist_model.dart';

class todoController extends GetxController
{
  var titleController=TextEditingController();
  bool value=false;

  var todo=<todoList>[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  bool isEmptyList()
  {
    if(todo.isEmpty)
      return true;
    else
      return false;
  }

  void addtoDo() async
  {
    var title=titleController.text;
    todoList todo=todoList(
      title: title,
      value: value
    );
  }



}