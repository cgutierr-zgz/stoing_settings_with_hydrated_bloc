import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydated Storage Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.select((SettingsCubit c) => c.state.themeMode),
      home: const SettingsPage(),
    );
  }
}
