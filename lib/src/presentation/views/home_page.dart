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
        title: const Text('Cálculo de Aumento de Salario'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          // Botón para ir a la Pantalla de Reporte PDF
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoute.report);
            },
            tooltip: 'Reporte PDF',
          ),
        ],
      ),
      // Drawer para ir a la Pantalla de Historial
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historial de Cálculos'),
              onTap: () {
                // Navega a la ruta de historial
                Navigator.of(context).popAndPushNamed(AppRoute.history);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Campo para Salario
              TextFormField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Salario Actual',
                  hintText: 'Ej: 450.00',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el salario.';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Ingrese un valor numérico positivo.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              // Campo para Antigüedad
              TextFormField(
                controller: _antiqueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Años de Antigüedad',
                  hintText: 'Ej: 12',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los años de antigüedad.';
                  }
                  if (double.tryParse(value) == null || double.parse(value) < 0) {
                    return 'Ingrese un valor numérico positivo o cero.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Botón de Cálculo
              ElevatedButton.icon(
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}