import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/operator_viewmodel.dart';
import '../../domain/entities/result_operator.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Operarios'),
        centerTitle: true,
      ),

      body: Consumer<OperatorViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.history.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 90, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No hay cálculos en el historial.',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Column(
              children: [
                const SizedBox(height: 15),

                const Icon(Icons.history, size: 70, color: Colors.blueGrey),
                const SizedBox(height: 10),

                const Text(
                  "Historial de Cálculos",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: viewmodel.history.length,
                    itemBuilder: (context, index) {
                      final item = viewmodel.history[
                          viewmodel.history.length - 1 - index
                      ];

                      return HistoryItemTile(
                        item: item,
                        index: viewmodel.history.length - index,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HistoryItemTile extends StatelessWidget {
  final ResultOperator item;
  final int index;

  const HistoryItemTile({
    required this.item,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey.shade200,
          child: Text(
            '$index',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),

        title: Text(
          'Salario Final: \$${item.salaryFinal.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text(
          'Aumento: \$${item.updagre.toStringAsFixed(2)}',
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
