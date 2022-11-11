import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_page.dart';

import 'mocks.dart';
import 'pump_app.dart';

void main() {
  group('SettingsPage', () {
    setUp(setUpSettingsCubit);

    testWidgets('renders ThemeMode.system as initial state', (tester) async {
      await tester.pumpApp(
        const SettingsPage(),
        settingsCubit: settingsCubit,
      );
      expect(find.text('Current theme mode: ThemeMode.system'), findsOneWidget);
    });

    testWidgets('shows new themeMode when cubit is updated', (tester) async {
      await tester.pumpApp(
        const SettingsPage(),
        settingsCubit: settingsCubit,
      );
      expect(find.text('Current theme mode: ThemeMode.system'), findsOneWidget);

      settingsCubit.toggleThemeMode(ThemeMode.dark);
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.dark'), findsOneWidget);

      settingsCubit.toggleThemeMode(ThemeMode.light);
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.light'), findsOneWidget);

      settingsCubit.toggleThemeMode(ThemeMode.system);
      await tester.pumpAndSettle();
      expect(find.text('Current theme mode: ThemeMode.system'), findsOneWidget);
    });

    testWidgets('shows new themeMode when buttons are pressed', (tester) async {
      await tester.pumpApp(const SettingsPage());

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
