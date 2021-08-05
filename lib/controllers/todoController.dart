import 'package:get/get.dart';
import 'package:todo_app/controllers/authController.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/database.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;

  List<TodoModel> get todos => todoList;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
    super.onInit();
  }
}
