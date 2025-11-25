import '../entities/operator.dart';
import '../entities/result_operator.dart';

class CalculateUpgradeUsecase {

  ResultOperator exceute(Operator op){
    double updagre = 0;

    //logica del aumento
    if(op.salary <500){
      if(op.antique >=10){
        updagre =op.salary *0.20;
      }else{
        updagre = op.salary *0.05;
      }
    }
    final salaryFinal = op.salary + updagre;
    return ResultOperator(updagre: updagre, salaryFinal: salaryFinal);
  }
}