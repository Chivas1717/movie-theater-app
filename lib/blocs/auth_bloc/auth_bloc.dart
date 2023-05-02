import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/repositories.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'dart:developer';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _AuthRepository;

  AuthBloc(this._AuthRepository) : super(AuthLoadingState()) {
    on<RequestOtpAuthEvent>(_requestOtpAuthEvent);
    on<ProceedAuthEvent>(_proceedAuthEvent);
  }

  void _requestOtpAuthEvent(event, emit) async {
    emit(OtpLoadingState());
    try {
      final result = await _AuthRepository.requestOtp(event.phoneNumber);

      emit(OtpLoadedState());
    } catch (e) {
      // log(e.toString());
      emit(OtpErrorState(e.toString()));
    }
  }

  void _proceedAuthEvent(event, emit) async {
    emit(AuthLoadingState());
    try {
      final result =
          await _AuthRepository.getAcessToken(event.phoneNumber, event.otp);
      emit(AuthLoadedState(result));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
