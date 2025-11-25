import 'package:flutter/material.dart';
import '../../domain/entities/result_operator.dart';

class ResultPage extends StatelessWidget {
  final ResultOperator resultado;

  const ResultPage({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    final formattedUpgrade = resultado.updagre.toStringAsFixed(2);
    final formattedFinalSalary = resultado.salaryFinal.toStringAsFixed(2);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado del Cálculo'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Título
            const Text(
              'Detalle del Aumento',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 30, thickness: 2),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text(
                        'Aumento Obtenido:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        '\$$formattedUpgrade',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                    const Divider(),
                    
                    // Salario Final
                    ListTile(
                      title: const Text(
                        'Salario Final:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        '\$$formattedFinalSalary',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Botón para volver a calcular
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: const Text(
                  'Nuevo Cálculo',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}