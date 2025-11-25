import 'package:flutter/material.dart';
import 'esquema_color.dart';


class TemaAppbar {
  static const AppBarTheme estilo= AppBarTheme(
    backgroundColor: EsquemaColor.terciary,
    foregroundColor: EsquemaColor.help,
    centerTitle: true,
    elevation: 3,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: EsquemaColor.secundary
    ),
  );
}