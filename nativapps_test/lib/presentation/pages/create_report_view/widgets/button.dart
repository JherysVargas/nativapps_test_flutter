import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:nativapps_test/presentation/widgets/activity_indicator.dart';
import 'package:nativapps_test/presentation/pages/create_report_view/create_report_controller.dart';

final injector = GetIt.instance;

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.labelStyle,
    this.backgroundColor,
  });

  final String label;
  final Color? backgroundColor;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final controller = injector.get<CreateReportController>();
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isLoading,
      builder: (BuildContext ctx, bool isLoading, Widget? child) {
        return isLoading ? const ActivityIndicator() : child!;
      },
      child: _buildButton(context, controller),
    );
  }

  Widget _buildButton(BuildContext context, CreateReportController controller) {
    return InkWell(
      onTap: () => controller.saveReport(context),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: _buildLabel(),
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ).merge(labelStyle),
    );
  }
}
