class Question {
  String id;
  String name;
  List<String> answers;
  Question({ required this.name, this.id= '', required this.answers});

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name,
    'answers': answers
  };

  static Question fromJson (Map<String, dynamic> json) => Question(
      name: json['name'],
       id: json['id'],
       answers: json['answers']


  );
}



