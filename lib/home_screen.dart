import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFHomePage extends StatefulWidget {
  const PDFHomePage({super.key});

  @override
  PDFHomePageState createState() => PDFHomePageState();
}

class PDFHomePageState extends State<PDFHomePage> {
  String? _filePath;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Center(
        child: _filePath == null
            ? const Text('Tap on + to select a PDF File')
            : SfPdfViewer.file(
                File(_filePath!),
                key: _pdfViewerKey,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'Select PDF',
        child: const Icon(Icons.add),
      ),
    );
  }
}
