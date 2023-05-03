import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/movies_bloc/movies_event.dart';
import 'package:movie_theater_app/blocs/movies_bloc/movies_state.dart';
import 'package:movie_theater_app/repositories/repositories.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesBloc(this._moviesRepository) : super(MoviesLoadingState()) {
    on<LoadMoviesEvent>(_loadMoviesEvent);
  }

  void _loadMoviesEvent(event, emit) async {
    emit(MoviesLoadingState());
    try {
      final result =
          await _moviesRepository.getMovies(event.searchValue, event.dateValue);
      log('result accepted');
      emit(MoviesLoadedState(result));
    } catch (e) {
      log(e.toString());
      emit(MoviesErrorState(e.toString()));
    }
  }
}
