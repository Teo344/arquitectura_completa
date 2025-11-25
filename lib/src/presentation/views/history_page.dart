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
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Consumer<OperatorViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.history.isEmpty) {
            return const Center(
              child: Text(
                'No hay cálculos en el historial.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          
          return ListView.builder(
            itemCount: viewmodel.history.length,
            itemBuilder: (context, index) {
              // Mostrar el más reciente primero
              final item = viewmodel.history[viewmodel.history.length - 1 - index]; 
              return HistoryItemTile(item: item, index: viewmodel.history.length - index);
            },
          );
        },
      ),
    );
  }
}

class HistoryItemTile extends StatelessWidget {
  final ResultOperator item;
  final int index;

  const HistoryItemTile({required this.item, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text('$index'),
          backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          foregroundColor: Colors.white,
        ),
        title: Text(
          'Salario Final: \$${item.salaryFinal.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Aumento: \$${item.updagre.toStringAsFixed(2)}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navegar a la página de resultados con este item si es necesario
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cálculo #${index} - Salario Final: \$${item.salaryFinal.toStringAsFixed(2)}')),
          );
        },
      ),
    );
  }
}