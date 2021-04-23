import 'package:flutter/cupertino.dart';

List<Pregunta> bancoPreguntas = [
  Pregunta(p: 'Puedes llevar una vaca a bajar las escaleras, pero, no a subirlas.', r: false),
  Pregunta(p: 'Aproximadamente una cuarta parte de los huesos humanos están en los pies.', r: true),
  Pregunta(p: 'La sangre de las babosas es verde.', r: true),
];
List<Icon> guardaPuntos = [];
class Pregunta{
  String textoPregunta;
  bool respuestaPregunta;
  Pregunta({String p, bool r}){
    textoPregunta = p;
    respuestaPregunta = r;
  }
}