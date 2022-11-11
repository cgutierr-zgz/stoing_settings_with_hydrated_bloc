import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings.dart';

class SettingsCubit extends HydratedCubit<Settings> {
  SettingsCubit(/*[this._id]*/)
      : super(const Settings(themeMode: ThemeMode.system));

  //final String? _id;

  // @override
  // String get id => _id ?? '';

  void toggleThemeMode(ThemeMode themeMode) =>
      emit(state.copyWith(themeMode: themeMode));

  @override
  Settings fromJson(Map<String, dynamic> json) => Settings.fromJson(json);

  @override
  Map<String, dynamic> toJson(Settings state) => state.toJson();
}
