import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stoing_settings_with_hydrated_bloc/settings_cubit.dart';

class MockStorage extends Mock implements Storage {}

late Storage storage;
late SettingsCubit settingsCubit;

void setUpStorage() {
  storage = MockStorage();
  when(() => storage.write(any(), any() as dynamic)).thenAnswer(
    (_) async {},
  );
  HydratedBloc.storage = storage;
}

void setUpSettingsCubit() {
  setUpStorage();
  settingsCubit = SettingsCubit();
}
