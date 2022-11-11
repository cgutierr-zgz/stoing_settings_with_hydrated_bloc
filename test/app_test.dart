import 'package:flutter_test/flutter_test.dart';
import 'package:stoing_settings_with_hydrated_bloc/app.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_page.dart';

import 'mocks.dart';
import 'pump_app.dart';

void main() {
  group('MyApp', () {
    setUp(setUpSettingsCubit);

    testWidgets('renders SettingsPage', (tester) async {
      await tester.pumpApp(
        const MyApp(),
        settingsCubit: settingsCubit,
      );

      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
