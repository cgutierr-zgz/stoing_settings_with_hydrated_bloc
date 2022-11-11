import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_page.dart';

import 'hydrated_storage_mock.dart';
import 'pump_app.dart';

void main() {
  group('SettingsPage', () {
    initHydratedStorage();

    testWidgets('renders ThemeMode.system as initial state', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => SettingsCubit(),
          child: const SettingsPage(),
        ),
      );
      expect(find.text('Current theme mode: ThemeMode.system'), findsOneWidget);
    });

    testWidgets('shows new themeMode when cubit is updated', (tester) async {
      final cubit = SettingsCubit();

      await tester.pumpApp(
        BlocProvider(
          create: (_) => cubit,
          child: const SettingsPage(),
        ),
      );

      cubit.toggleThemeMode(ThemeMode.dark);
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.dark'), findsOneWidget);

      cubit.toggleThemeMode(ThemeMode.light);
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.light'), findsOneWidget);

      cubit.toggleThemeMode(ThemeMode.system);
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.system'), findsOneWidget);
    });

    testWidgets('shows new themeMode when buttons are pressed', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => SettingsCubit(),
          child: const SettingsPage(),
        ),
      );

      await tester.tap(find.text('dark'));
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.dark'), findsOneWidget);

      await tester.tap(find.text('light'));
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.light'), findsOneWidget);

      await tester.tap(find.text('system'));
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.system'), findsOneWidget);
    });
  });
}
