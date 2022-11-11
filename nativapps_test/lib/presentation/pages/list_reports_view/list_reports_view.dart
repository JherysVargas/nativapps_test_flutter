import 'package:flutter/material.dart';

import 'widgets/list_report.dart';

class ListReportsView extends StatelessWidget {
  const ListReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: const ListReport(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/createReport'),
      ),
    );
  }
}
