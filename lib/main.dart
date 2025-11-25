import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/domain/usescases/calculate_upgrade_usecase.dart';
import 'src/presentation/viewmodels/operator_viewmodel.dart';
import 'src/presentation/routes/app_route.dart';
import 'theme/tema_general.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OperatorViewmodel(CalculateUpgradeUsecase()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aumento Operario',
      debugShowCheckedModeBanner: false,
      theme: TemaGeneral.claro,
      initialRoute: AppRoute.home,
      routes: AppRoute.routes,
    );
  }
}
