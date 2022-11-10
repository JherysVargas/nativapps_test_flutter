import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'widgets/button.dart';
import 'widgets/card_image.dart';
import 'create_report_controller.dart';
import 'widgets/input_description.dart';

final injector = GetIt.instance;

class CreateReportView extends StatefulWidget {
  const CreateReportView({super.key});

  @override
  State<CreateReportView> createState() => _CreateReportViewState();
}

class _CreateReportViewState extends State<CreateReportView> {
  late final CreateReportController controller;

  @override
  void initState() {
    super.initState();
    controller = injector.get<CreateReportController>()..init();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Crear reporte'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: const [
            Center(child: CardImage()),
            SizedBox(height: 55),
            InputDescription(),
            SizedBox(height: 55),
            Button(label: 'Guardar'),
          ],
        ),
      ),
    );
  }
}
