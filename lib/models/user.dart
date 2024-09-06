class User {
  String? id;
  String? nom;
  String? tel;
  String? email;
  String? password;

  User({this.id, this.nom, this.tel, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    tel = json['tel'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['tel'] = tel;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}