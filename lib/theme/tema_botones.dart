import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaBotones {
  static final botonPrincipal = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: EsquemaColor.success,
      foregroundColor: EsquemaColor.primary,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide(color: EsquemaColor.help),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  static final botonSecundario = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: EsquemaColor.error,
      foregroundColor: EsquemaColor.primary,
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide(color: EsquemaColor.help),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  static final botonGuardar = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: EsquemaColor.guardar,
      foregroundColor: EsquemaColor.help,
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide(color: EsquemaColor.help),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );


    static final botonSubir = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: EsquemaColor.subir,
      foregroundColor: EsquemaColor.primary,
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide(color: EsquemaColor.help),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );


      static final botonDefault = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: EsquemaColor.terciary,
      foregroundColor: EsquemaColor.primary,
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide(color: EsquemaColor.help),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
