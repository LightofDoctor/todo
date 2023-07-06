class Question {
  String id;
  String name;
  Question({ required this.name, this.id= ''});

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name
  };

  static Question fromJson (Map<String, dynamic> json) => Question(
      name: json['name'],
       id: json['id'],

  );
}



