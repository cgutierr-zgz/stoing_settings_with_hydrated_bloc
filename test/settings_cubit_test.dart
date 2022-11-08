import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:stoing_settings_with_hydrated_bloc/settings.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';

import 'hydrated_storage_mock.dart';

Future<void> sleep() => Future<void>.delayed(const Duration(milliseconds: 100));

void main() {
  group('SettingsCubit', () {
    initHydratedStorage();

    test('initial state theme is ThemeMode.system', () {
      expect(
        SettingsCubit().state,
        equals(const Settings(themeMode: ThemeMode.system)),
      );
    });

    blocTest<SettingsCubit, Settings>(
      'emits ThemeMode.dark when dark theme is toggled',
      build: SettingsCubit.new,
      act: (cubit) => cubit.toggleThemeMode(ThemeMode.dark),
      expect: () => [equals(const Settings(themeMode: ThemeMode.dark))],
    );

    blocTest<SettingsCubit, Settings>(
      'emits ThemeMode.light when light theme is toggled',
      build: SettingsCubit.new,
      act: (cubit) => cubit.toggleThemeMode(ThemeMode.light),
      expect: () => [equals(const Settings(themeMode: ThemeMode.light))],
    );

    blocTest<SettingsCubit, Settings>(
      'emits ThemeMode.system when system theme is toggled',
      build: SettingsCubit.new,
      act: (cubit) => cubit.toggleThemeMode(ThemeMode.system),
      expect: () => [equals(const Settings(themeMode: ThemeMode.system))],
    );

    blocTest<SettingsCubit, Settings>(
      'emits multiple states when theme is toggled',
      build: SettingsCubit.new,
      act: (cubit) => cubit
        ..toggleThemeMode(ThemeMode.dark)
        ..toggleThemeMode(ThemeMode.light)
        ..toggleThemeMode(ThemeMode.system),
      expect: () => equals([
        const Settings(themeMode: ThemeMode.dark),
        const Settings(themeMode: ThemeMode.light),
        const Settings(themeMode: ThemeMode.system),
      ]),
    );
  });

  group('Settings cubit storage', () {
    late Storage storage;

    setUp(() async {
      storage = await HydratedStorage.build(
        storageDirectory: Directory(
          path.join(Directory.current.path, '.cache'),
        ),
      );
      HydratedBloc.storage = storage;
    });

    tearDown(() async {
      await storage.clear();
      try {
        Directory(
          path.join(Directory.current.path, '.cache'),
        ).deleteSync(recursive: true);
        await HydratedStorage.hive.deleteFromDisk();
      } catch (_) {}
    });

    test('persists and restores settings correctly', () async {
      const themeMode = ThemeMode.dark;
      final cubit = SettingsCubit();

      expect(
        cubit.state,
        equals(const Settings(themeMode: ThemeMode.system)),
      );

      cubit.toggleThemeMode(themeMode);
      await sleep();

      expect(SettingsCubit().state, const Settings(themeMode: themeMode));
    });
  });
}
