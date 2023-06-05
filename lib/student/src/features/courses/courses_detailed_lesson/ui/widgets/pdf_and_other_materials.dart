import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdfx/pdfx.dart';
import '../../../../../../../constants/app_colors.dart';

//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//id : Pdf
class PdfAndOtherMaterials extends StatefulWidget {
  const PdfAndOtherMaterials({Key? key, required this.file}) : super(key: key);
  final String file;

  @override
  State<PdfAndOtherMaterials> createState() => _PdfAndOtherMaterialsState();
}

class _PdfAndOtherMaterialsState extends State<PdfAndOtherMaterials> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openData(base64Decode(widget.file)),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 700,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray200.withOpacity(0.1),
        ),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              Container(
                height: 650,
                width: double.infinity,
                child: PdfView(
                  //controller: pdfController,
                  renderer: (PdfPage page) => page.render(
                    width: page.width * 5,
                    height: page.height * 2,
                    format: PdfPageImageFormat.jpeg,
                    backgroundColor: '#FFFFFF',
                  ),
                  controller: pdfController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
