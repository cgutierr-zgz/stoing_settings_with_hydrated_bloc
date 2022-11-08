import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stoing_settings_with_hydrated_bloc/app.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_page.dart';

import 'hydrated_storage_mock.dart';

void main() {
  group('MyApp', () {
    initHydratedStorage();

    testWidgets('renders SettingsPage', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (_) => SettingsCubit(),
          child: const MyApp(),
        ),
      );
      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
