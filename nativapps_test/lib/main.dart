import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nativapps_test/core/paths/app_paths.dart';
import 'package:nativapps_test/core/config/init_app_config.dart';

import 'core/bloc/report/report_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCubit(),
      child: MaterialApp(
        title: 'NativApps',
        theme: ThemeData(primarySwatch: Colors.blue),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
