import 'package:flutter/material.dart';
import 'package:laboratorio_2/preguntas.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> answerPoints = [];
  int numberOfQuestion = 0;

  void verifyAnswer(bool answer) {
    bool isAnswerCorrect = answer == questions[numberOfQuestion].isTrue;
    
    answerPoints.add(Icon(
      isAnswerCorrect ? Icons.check : Icons.close,
      color: isAnswerCorrect ? Colors.green : Colors.red,
    ));
    
    numberOfQuestion++;
  }
  
  void finishGame() {
    Alert(
      context: context,
      title: 'Final!',
      desc: 'Llegaste al final del cuestionario',
    ).show();
    
    numberOfQuestion = 0;
    answerPoints = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[numberOfQuestion].statement,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Verdadero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (numberOfQuestion >= questions.length - 1) {
                    finishGame();
                  } else {
                    verifyAnswer(true);
                  }
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (numberOfQuestion >= questions.length - 1) {
                    finishGame();
                  } else {
                    verifyAnswer(false);
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: answerPoints,
        )
      ],
    );
  }
}
