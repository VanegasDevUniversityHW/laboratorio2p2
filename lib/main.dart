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
        backgroundColor: Colors.grey.shade900,
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
  int numeroPregunta = 0;
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
                bancoPreguntas[numeroPregunta].textoPregunta,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
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
                  if (numeroPregunta >= bancoPreguntas.length - 1) {
                    Alert(
                      context: context,
                      title: 'Final!',
                      desc: 'Llegaste al final del cuestionario',
                    ).show();
                    numeroPregunta=0;
                    guardaPuntos = [];
                  } else {
                    bool respuestaCorrecta = bancoPreguntas[numeroPregunta].respuestaPregunta;
                    if (respuestaCorrecta == true) {
                      guardaPuntos.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      guardaPuntos.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    setState(() {
                      numeroPregunta++;
                    });
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
                  if (numeroPregunta >= bancoPreguntas.length - 1) {
                    Alert(
                      context: context,
                      title: 'Final!',
                      desc: 'Llegaste al final del cuestionario',
                    ).show();
                    numeroPregunta=0;
                    guardaPuntos = [];
                  } else {
                    bool respuestaCorrecta = bancoPreguntas[numeroPregunta].respuestaPregunta;
                    if (respuestaCorrecta == true) {
                      guardaPuntos.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      guardaPuntos.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    setState(() {
                      numeroPregunta++;
                    });
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: guardaPuntos,
        )
      ],
    );
  }
}
