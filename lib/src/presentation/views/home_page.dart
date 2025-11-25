import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/operator_viewmodel.dart';
import '../routes/app_route.dart';
import '../../domain/entities/result_operator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _salaryController = TextEditingController();
  final _antiqueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _calculateAndNavigate() {
    if (_formKey.currentState!.validate()) {
      final salary = double.tryParse(_salaryController.text) ?? 0.0;
      final antique = double.tryParse(_antiqueController.text) ?? 0.0;

      final viewmodel = Provider.of<OperatorViewmodel>(context, listen: false);

      final ResultOperator result = viewmodel.calculate(salary, antique);

      Navigator.of(context).pushNamed(
        AppRoute.result,
        arguments: result,
      );
    }
  }

  @override
  void dispose() {
    _salaryController.dispose();
    _antiqueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aumento Salarial'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                const Icon(
                  Icons.monetization_on,
                  size: 100,
                  color: Colors.green,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Calculadora de Incremento Salarial",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Salario Actual',
                    hintText: 'Ej: 450.00',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black45),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money, color: Colors.black),
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese el salario.';
                    }
                    if (double.tryParse(value) == null || double.parse(value) <= 0) {
                      return 'Ingrese un valor numérico positivo.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _antiqueController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Años de Antigüedad',
                    hintText: 'Ej: 12',
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black45),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.access_time, color: Colors.black),
                  ),
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese los años de antigüedad.';
                    }
                    if (double.tryParse(value) == null || double.parse(value) < 0) {
                      return 'Ingrese un número positivo o cero.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _calculateAndNavigate,
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text(
                      'Calcular Aumento',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ✔ NUEVOS BOTONES EN FILA
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.of(context).pushNamed(AppRoute.history),
                        icon: const Icon(Icons.history, color: Colors.white),
                        label: const Text('Historial', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.of(context).pushNamed(AppRoute.report),
                        icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                        label: const Text('Exportar PDF', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
