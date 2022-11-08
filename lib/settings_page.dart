import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select((SettingsCubit c) => c.state.themeMode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current theme mode: $themeMode'),
            ...List.generate(
              ThemeMode.values.length,
              (index) {
                final themeMode = ThemeMode.values[index];

                return ElevatedButton(
                  onPressed: () =>
                      context.read<SettingsCubit>().toggleThemeMode(themeMode),
                  child: Text(themeMode.name),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
