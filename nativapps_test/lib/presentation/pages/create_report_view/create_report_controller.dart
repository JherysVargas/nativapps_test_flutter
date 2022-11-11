import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nativapps_test/core/bloc/report/report_cubit.dart';
import 'package:nativapps_test/core/utils/preferences.dart';
import 'package:nativapps_test/data/models/report/report_model.dart';
import 'package:nativapps_test/presentation/widgets/snackbar_alert_widget.dart';

@singleton
class CreateReportController {
  XFile? _selectedPhoto;

  late TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void init() {
    descriptionController = TextEditingController();
  }

  void takePhoto(XFile? file) => (_selectedPhoto = file);

  void saveReport(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (_selectedPhoto == null) {
      _showAlerError(context);
      return;
    }

    context.read<ReportCubit>().addNewReport(ReportModel(
          image: _selectedPhoto!.path,
          description: descriptionController.text,
        ));

    Navigator.of(context).pop();
  }

  void _showAlerError(BuildContext context) {
    SnackBarFloating.show(
      context,
      'Debes cargar una foto',
      type: TypeAlert.error,
    );
  }

  void dispose() {
    _selectedPhoto = null;
    isLoading.value = false;
    descriptionController.dispose();
  }
}
