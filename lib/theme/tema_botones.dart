import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaBotones {
  static final botonPrincipal = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: EsquemaColor.primary,
      foregroundColor: EsquemaColor.textBlack,
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 14
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textStyle: TextStyle(fontWeight: FontWeight.bold)
    )
  );

  static final botonSecundario = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: EsquemaColor.textBlack,
      padding: EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 10
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      side: BorderSide(color: EsquemaColor.primary),
      textStyle: TextStyle(fontWeight: FontWeight.bold)
    )
  );



}