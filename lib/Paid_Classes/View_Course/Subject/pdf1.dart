import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PDF extends StatelessWidget {
  const PDF({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PDF View"),
      ),
      body: SfPdfViewer.asset("assets/sample1.pdf"),
    );
  }
}
