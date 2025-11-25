import 'package:flutter/material.dart';
import '../../domain/entities/operator.dart';
import '../../domain/entities/result_operator.dart';
import '../../domain/usescases/calculate_upgrade_usecase.dart';


class OperatorViewmodel extends ChangeNotifier {
  final CalculateUpgradeUsecase _useCase;
  OperatorViewmodel(this._useCase);

  // Historial de resultados
  final List<ResultOperator> _history = [];
  List<ResultOperator> get history => _history;

  ResultOperator? result;

  ResultOperator calculate(double salary, double antique){
    final op = Operator(salary: salary, antique: antique);
    result = _useCase.exceute(op);
    
    //Agregar el resultado al historial
    _history.add(result!);

    notifyListeners();
    return result!; //verifico que no sea nulo
  }
}