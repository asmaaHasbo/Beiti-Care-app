
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';

import '../../domain/repo/preferences_repository.dart';


part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {

  final PreferencesRepository preference = getIt<PreferencesRepository>();
  AppBloc(
 )
      : super(const AppState());


}
