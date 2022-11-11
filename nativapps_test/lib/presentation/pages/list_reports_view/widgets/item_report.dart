import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nativapps_test/data/models/report/report_model.dart';

class ItemReport extends StatelessWidget {
  const ItemReport({super.key, required this.report});

  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: _buildImage(),
        title: Text(report.description!),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.file(
        File(report.image!),
        width: 60,
        height: 90,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
