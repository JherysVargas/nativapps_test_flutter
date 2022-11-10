import 'package:flutter/material.dart';

import 'widgets/item_report.dart';

class ListReportsView extends StatelessWidget {
  const ListReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: _buildListReports(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/createReport'),
      ),
    );
  }

  Widget _buildListReports() {
    return ListView.separated(
      itemCount: 20,
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _, int __) => const ItemReport(),
      separatorBuilder: (BuildContext _, int __) => const SizedBox(height: 15),
    );
  }
}
