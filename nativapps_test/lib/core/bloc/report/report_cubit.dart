import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:nativapps_test/core/utils/preferences.dart';
import 'package:nativapps_test/data/models/report/report_model.dart';

class ReportCubit extends Cubit<List<ReportModel>> {
  ReportCubit() : super([]);

  void getListReports() {
    final String reportsPreference = UserPreferences.reports;

    if (reportsPreference.isNotEmpty) {
      final List<dynamic> data = json.decode(reportsPreference);
      final List<ReportModel> reports = List<ReportModel>.from(
        data.map((x) => ReportModel.fromJson(x)),
      );

      emit(reports);
    }
  }

  void addNewReport(ReportModel report) {
    final List<ReportModel> newListReport = [...state, report];
    UserPreferences.reports = json.encode(newListReport);
    emit(newListReport);
  }
}
