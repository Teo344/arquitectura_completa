import 'package:arquitectura_completa/src/presentation/views/history_page.dart';
import 'package:arquitectura_completa/src/presentation/views/report_page.dart';
import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/result_page.dart';
import '../../domain/entities/result_operator.dart';

class AppRoute {
  static const home = '/';
  static const result = '/result';
  static const history = '/history';
  static const report = '/report';

  //map of routes

  static Map<String, WidgetBuilder> routes ={
    home: (_)=> const HomePage(),
    result: (context){
    final result = 
    ModalRoute.of(context)!.settings.arguments as ResultOperator;
    return ResultPage(resultado:result);
    },
    history: (_)=> const HistoryPage(),
    report: (_)=> const ReportPage(),
  };
}