import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';


extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    SettingsCubit? settingsCubit,
  }) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: settingsCubit ?? SettingsCubit()),
        ],
        child: MaterialApp(
          home: widget,
        ),
      ),
    );
  }
}
