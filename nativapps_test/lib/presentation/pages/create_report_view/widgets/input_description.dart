import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:nativapps_test/presentation/pages/create_report_view/create_report_controller.dart';

final injector = GetIt.instance;

class InputDescription extends StatelessWidget {
  const InputDescription({super.key});

  static const OutlineInputBorder _borderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFcdcdcd)),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  @override
  Widget build(BuildContext context) {
    final controller = injector.get<CreateReportController>();
    return Form(
      key: controller.formKey,
      child: TextFormField(
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFfbfbfb),
          hintText: "Descripción",
          hintStyle: TextStyle(color: Colors.grey.shade400),
          border: _borderStyle,
          enabledBorder: _borderStyle,
        ),
        style: const TextStyle(
          fontSize: 16.0,
        ),
        controller: controller.descriptionController,
        validator: (String? value) {
          if (value!.isEmpty) {
            return "La descripción es obligatoria";
          }
          return null;
        },
      ),
    );
  }
}
