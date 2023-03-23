class CreateQuestion {
  String id;
  String name;
  CreateQuestion({ required this.name, this.id= ''});

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name
  };

}



