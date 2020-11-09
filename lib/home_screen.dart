import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_generator/pdf_viewer_screen.dart';

class HomeScreen extends StatelessWidget {
  final pdf = pw.Document();

  _writePDF() {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32.0),
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Text(
                "Demo PDF",
                style: pw.TextStyle(
                  color: PdfColor.fromHex("00e0d8"),
                ),
              ),
            ),
            pw.Paragraph(
              text:
                  "A paragraph is a self-contained unit of discourse in writing dealing with a particular point or idea. A paragraph consists of one or more sentences. Though not required by the syntax of any language, paragraphs are usually an expected part of formal writing, used to organize longer prose.",
            ),
            pw.Container(
              width: double.infinity,
              height: 100.0,
              child: pw.Row(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Container(
                      color: PdfColor.fromHex("00e0d8"),
                    ),
                  ),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Container(
                      color: PdfColor.fromHex("d6cb00"),
                    ),
                  )
                ],
              ),
            ),
          ];
        },
      ),
    );
  }

  Future _savePDF(BuildContext context) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    String path = "$documentPath/example.pdf";
    File file = File(path);
    file.writeAsBytesSync(pdf.save());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(path: path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Generator"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          _writePDF();
          await _savePDF(context);
        },
      ),
    );
  }
}
