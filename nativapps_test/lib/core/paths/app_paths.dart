import 'package:flutter/material.dart';
import 'package:nativapps_test/presentation/pages/create_report_view/create_report_view.dart';
import 'package:nativapps_test/presentation/pages/list_reports_view/list_reports_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(builder: (_) => const ListReportsView()),
      '/createReport':
          MaterialPageRoute(builder: (_) => const CreateReportView()),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
