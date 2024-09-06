class AllTodos {
  bool? success;
  String? message;
  List<Todo>? todo;

  AllTodos({this.success, this.message, this.todo});

  AllTodos.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      todo = <Todo>[];
      json['data'].forEach((v) {
        todo!.add(Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (todo != null) {
      data['data'] = todo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {
  String? id;
  String? userId;
  String? titre;
  String? description;
  String? date;
  String? dateUpdate;

  Todo(
      {this.id,
      this.userId,
      this.titre,
      this.description,
      this.date,
      this.dateUpdate});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    titre = json['titre'];
    description = json['description'];
    date = json['date'];
    dateUpdate = json['date_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['titre'] = titre;
    data['description'] = description;
    data['date'] = date;
    data['date_update'] = dateUpdate;
    return data;
  }
}