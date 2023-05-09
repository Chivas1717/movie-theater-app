import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/repositories.dart';
import 'sessions_event.dart';
import 'sessions_state.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  final SessionsRepository _sessionsRepository;

  SessionsBloc(this._sessionsRepository) : super(SessionsLoadingState()) {
    on<LoadSessionsEvent>(_loadSessionsEvent);
  }

  void _loadSessionsEvent(event, emit) async {
    emit(SessionsLoadingState());
    try {
      final result =
          await _sessionsRepository.getSessions(event.movieId, event.dateValue);
      log('result sessions accepted');
      emit(SessionsLoadedState(result));
    } catch (e) {
      log(e.toString());
      emit(SessionsErrorState(e.toString()));
    }
  }
}
