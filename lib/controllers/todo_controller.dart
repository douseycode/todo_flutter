import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/models/user.dart';
import 'package:todo/utils/baseUrl.dart';
import 'package:todo/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:todo/utils/snackbar.dart';

class TodoController extends GetxController{

  List<Todo> todos = [];
  List<Todo> filteredTodo = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchMyTodo();
  }

  fetchMyTodo () async{
    var usr = await SharedPrefs().getUser();

    User user = User.fromJson(json.decode(usr));

    var response = await http.post(Uri.parse('${baseUrl}todo.php'), body: {
      "user_id" : user.id
    });

    var res = await json.decode(response.body);

    if(res['success']){
      todos = AllTodos.fromJson(res).todo!;
      filteredTodo = AllTodos.fromJson(res).todo!;
      update();
    }else{
      customSnackbar("Erreur", "Probleme en recuperant", "error");
    }

  }


  search(String val){
    if(val.isEmpty){
      filteredTodo = todos;
      update();
      return;
    }

     filteredTodo = todos.where((todo){
      return todo.titre!.toLowerCase().contains(val.toLowerCase());
     }).toList();

  update();
  }

}