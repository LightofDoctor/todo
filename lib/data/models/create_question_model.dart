class Users {
  String id;
  String name;
  Users({ required this.name, this.id= ''});

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name
  };

  static Users fromJson (Map<String, dynamic> json) => Users(
      name: json['name'],
       id: json['id'],

  );
}



