import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/custom_search.dart';
import 'package:todo/widgets/custom_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DouseyCode",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (context)=>Dialog(
                child: ManipulateTodo(),
              ));
            }, 
            icon: const FaIcon(FontAwesomeIcons.plus, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<TodoController>(
          builder: (controller) {
            return Column(
              children: [
                CustomSearch(onChange: (val) {
                  controller.search(val);
                }),
                const SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.filteredTodo.map((todo) => Slidable(
                        child: TodoTile(todo: todo),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: FontAwesomeIcons.edit,
                              label: "Edit",
                            ),
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: FontAwesomeIcons.trash,
                              label: "Delete",
                            ),
                          ],
                        ),
                      )).toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
       borderRadius: BorderRadius.circular(14),
       boxShadow: const [
        BoxShadow(
          color: Color(0x02900000),
        ),
       ],
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.titre!,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 21,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            todo.date!,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xff000000),
              fontWeight: FontWeight.w400
            ),
          ),
          Text(
            todo.description!,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xff949494),
            ),
          ),
        ],
      ),
    );
  }
}

class ManipulateTodo extends StatelessWidget {
  const ManipulateTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
              "Ajouter todo",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 21,
                color: Color(0xff000000),
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 30,),
            CustomTextField(
              hint: "Titre",
      
            ),
            CustomTextField(
              hint: "Description",
              
            )
        ],
      ),
    );
  }
}