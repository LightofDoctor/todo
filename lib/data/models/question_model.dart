import 'package:todo/data/models/answer_model.dart';

class QuestionModel {
  String id;
  String name;
  bool isAnonymous;
  bool isMultiple;
  List<AnswerModel> answers;
  QuestionModel({this.id = '', required this.name, this.isAnonymous = false, this.isMultiple = false, required this.answers});

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name
  };

  static QuestionModel fromJson (Map<String, dynamic> json) => QuestionModel(
      name: json['name'],
       id: json['id'],

  );
}



