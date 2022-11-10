import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
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
