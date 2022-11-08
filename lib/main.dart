import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stoing_settings_with_hydrated_bloc/app.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory // Needed for web
        : await getApplicationDocumentsDirectory(),
  );

  runApp(
    BlocProvider(
      create: (context) => SettingsCubit(), // Provide the cubit to the root
      child: const MyApp(),
    ),
  );
}
