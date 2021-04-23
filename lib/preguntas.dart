import 'package:flutter/cupertino.dart';

List<Question> questions = [
  Question(statement: 'Fue SpaceX fundada por Elon Musk?', isTrue: true),
  Question(statement: 'La tierra gira alrededor del sol?', isTrue: false),
  Question(statement: 'La tierra es plana?', isTrue: false),
];

class Question{
  String statement;
  bool isTrue;

  Question( {String statement, bool isTrue} ){
    this.statement = statement;
    this.isTrue = isTrue;
  }
}