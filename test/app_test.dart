import 'package:flutter_test/flutter_test.dart';
import 'package:stoing_settings_with_hydrated_bloc/app.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_page.dart';

import 'pump_app.dart';

void main() {
  group('MyApp', () {
    testWidgets('renders SettingsPage', (tester) async {
      await tester.pumpApp(const MyApp());

      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
