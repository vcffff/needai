import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  int current = 0;
  int total = 0;
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
      final document = PdfDocument.openAsset('assets/pdfs/sat.vocab.pdf');
      setState(() {
        pdfControllerPinch = PdfControllerPinch(document: document);
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
        appBar: AppBar(title: Text('Books (${current + 1}/$total)')),
        body: const Center(child: Text('PDF viewing is not supported')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body:
          errorMessage != null
              ? Center(child: Text(errorMessage!))
              : pdfControllerPinch == null
              ? const Center(child: CircularProgressIndicator())
              : PdfViewPinch(
                scrollDirection: Axis.horizontal,
                onPageChanged: (page) {
                  setState(() {
                    current = page;
                  });
                },
                controller: pdfControllerPinch!,
                onDocumentLoaded: (page) {
                  setState(() {
                    total = page.pagesCount;
                  });
                },
              ),
    );
  }
}
