import 'package:flutter/material.dart';
import 'esquema_color.dart';
import 'tipografia.dart';
import 'tema_appbar.dart';
import 'tema_botones.dart';
import 'tema_fondos.dart';
import 'tema_formularios.dart';


class TemaGeneral {
  static ThemeData claro = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 12, 55, 75),
      secondary: const Color.fromARGB(255, 119, 92, 47),
      background: const Color.fromARGB(255, 21, 18, 188),
      onPrimary: const Color.fromARGB(255, 36, 18, 202),
      onSecondary: const Color.fromARGB(255, 26, 198, 175),
      onPrimaryFixed: const Color.fromARGB(255, 255, 255, 255),
    ),
    textTheme: Tipografia.texto,
    appBarTheme: TemaAppbar.estilo,
    elevatedButtonTheme: TemaBotones.botonPrincipal,
    outlinedButtonTheme: TemaBotones.botonSecundario,
    inputDecorationTheme: TemaFormularios.camposTexto,
    scaffoldBackgroundColor: EsquemaColor.primary,
  );

  
}