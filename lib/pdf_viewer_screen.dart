import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PDFViewerScreen extends StatelessWidget {
  final String path;

  const PDFViewerScreen({
    Key key,
    @required this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      path: path,
    );
  }
}
