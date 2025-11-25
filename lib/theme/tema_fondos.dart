import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaFondos {
  static const BoxDecoration degradoPrincipal = BoxDecoration(
    gradient: LinearGradient(colors: [EsquemaColor.secundary , EsquemaColor.secundary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
    )
  );


  static const BoxDecoration fondoBlanco =BoxDecoration(
    color: Colors.white
  );

  static const BoxDecoration fondoGris = BoxDecoration(
    color: EsquemaColor.secundary,
  );

  
}