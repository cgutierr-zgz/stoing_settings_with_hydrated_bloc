import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';

import 'mocks.dart';

void main() {
  group('SettingsCubit', () {
    late Storage storage;

    setUp(() {
      storage = MockStorage();
      when(() => storage.write(any(), any() as dynamic)).thenAnswer(
        (_) async {},
      );
      HydratedBloc.storage = storage;
    });

    test('initial state theme is system mode', () {
      final settingsCubit = SettingsCubit();
      expect(settingsCubit.state.themeMode, equals(ThemeMode.system));
    });

    group('Toogle themeMode', () {
      blocTest<SettingsCubit, Settings>(
        'updates music volume',
        build: SettingsCubit.new,
        act: (bloc) {
          bloc.toggleThemeMode(ThemeMode.dark);
        },
        expect: () {
          return const [Settings(themeMode: ThemeMode.dark)];
        },
      );
    });

    group('json (de)serialization', () {
      test('fromJson converts from json to state', () {
        final settingsCubit = SettingsCubit();
        final result = settingsCubit.fromJson({'themeMode': 0});
        expect(result, const Settings(themeMode: ThemeMode.system));
      });
    });

    test('toJson converts from state to json', () {
      final settingsCubit = SettingsCubit();
      final result =
          settingsCubit.toJson(const Settings(themeMode: ThemeMode.system));
      expect(result, {'themeMode': 0});
    });
  });
}
