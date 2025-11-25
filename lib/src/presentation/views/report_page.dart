import 'dart:io';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


import '../viewmodels/operator_viewmodel.dart';
import '../../domain/entities/result_operator.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  Future<pw.Document> _generatePdfDocument(List<ResultOperator> history) async {
    final pdf = pw.Document();

    final headers = [
      '#',
      'Salario Inicial',
      'Aumento (\$)',
      'Salario Final (\$)',
      'Porcentaje',
    ];
    final data = history.asMap().entries.map((entry) {
      int index = entry.key + 1;
      ResultOperator item = entry.value;

      final initialSalary = item.salaryFinal - item.updagre;
      final percentage = initialSalary > 0
          ? (item.updagre / initialSalary * 100).toStringAsFixed(1) + '%'
          : 'N/A';

      return [
        index.toString(),
        initialSalary.toStringAsFixed(2),
        item.updagre.toStringAsFixed(2),
        item.salaryFinal.toStringAsFixed(2),
        percentage,
      ];
    }).toList();

final regularFont = await PdfGoogleFonts.notoSansRegular();
final boldFont = await PdfGoogleFonts.notoSansBold();


    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Reporte de Aumentos de Operarios',
                style: pw.TextStyle(fontSize: 24, font: boldFont),
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: headers,
                data: data,
                border: pw.TableBorder.all(color: PdfColors.grey600),
                headerStyle: pw.TextStyle(
                  font: boldFont,
                  color: PdfColors.white,
                ),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.blueGrey700,
                ),
                cellAlignment: pw.Alignment.centerRight,
                cellStyle: pw.TextStyle(font: regularFont, fontSize: 10),
              ),
              pw.SizedBox(height: 30),
              pw.Text(
                'Total de Cálculos: ${history.length}',
                style: pw.TextStyle(fontSize: 12, font: regularFont),
              ),
            ],
          );
        },
      ),
    );
    return pdf;
  }

Future<void> _sharePdf(
  BuildContext context,
  List<ResultOperator> history,
) async {
  if (history.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No hay datos para generar el reporte.')),
    );
    return;
  }

  try {
    final pdf = await _generatePdfDocument(history);

    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'reporte_operarios.pdf',
    );

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al compartir PDF: $e')),
    );
  }
}


  Future<void> _handlePdfAction(
    BuildContext context,
    OperatorViewmodel viewmodel,
  ) async {
    if (viewmodel.history.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay datos para generar el reporte.')),
      );
      return;
    }

    // Abre imprimir / guardar como PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        final pdf = await _generatePdfDocument(viewmodel.history);
        return pdf.save();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<OperatorViewmodel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte PDF'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.picture_as_pdf, size: 80, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                'Historial de cálculos para reportar: ${viewmodel.history.length} items.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // Botón para Guardar en la carpeta de Descargas
              ElevatedButton.icon(
                onPressed: () => _handlePdfAction(context, viewmodel),
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text(
                  'Imprimir / Guardar como PDF',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              const SizedBox(height: 20),

              // Botón para Compartir
              OutlinedButton.icon(
                onPressed: () => _sharePdf(context, viewmodel.history),
                icon: const Icon(Icons.share, color: Colors.white),
                label: const Text(
                  'Compartir Reporte',
                  style: TextStyle(fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
