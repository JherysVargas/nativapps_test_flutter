import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nativapps_test/core/bloc/report/report_cubit.dart';
import 'package:nativapps_test/data/models/report/report_model.dart';

import 'item_report.dart';

class ListReport extends StatefulWidget {
  const ListReport({super.key});

  @override
  State<ListReport> createState() => _ListReportState();
}

class _ListReportState extends State<ListReport> {
  @override
  void initState() {
    super.initState();
    context.read<ReportCubit>().getListReports();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, List<ReportModel>>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (BuildContext _, int index) => ItemReport(
            report: state[index],
          ),
          separatorBuilder: (BuildContext _, int __) =>
              const SizedBox(height: 15),
        );
      },
    );
  }
}
