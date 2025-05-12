import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  PdfControllerPinch? pdfControllerPinch;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      loadPdf();
    }
  }

  Future<void> loadPdf() async {
    try {
      // Create a Future<PdfDocument> for PdfControllerPinch
      final futureDoc = Future.value(await PdfDocument.openAsset('assets/pdfs/sat.vocab.pdf'));
      setState(() {
        pdfControllerPinch = PdfControllerPinch(document: futureDoc);
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load PDF: $e';
      });
    }
  }

  @override
  void dispose() {
    pdfControllerPinch?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text('Books')),
        body: const Center(
          child: Text(
            'PDF viewing is not supported on the web. Please download the app or the PDF file.',
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: errorMessage != null
          ? Center(child: Text(errorMessage!))
          : pdfControllerPinch == null
              ? const Center(child: CircularProgressIndicator())
              : PdfViewPinch(controller: pdfControllerPinch!),
    );
  }
}