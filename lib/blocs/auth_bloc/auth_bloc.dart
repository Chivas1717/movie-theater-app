import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/repositories.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthLoadingState()) {
    on<RequestOtpAuthEvent>(_requestOtpAuthEvent);
    on<ProceedAuthEvent>(_proceedAuthEvent);
  }

  void _requestOtpAuthEvent(event, emit) async {
    emit(OtpLoadingState());
    try {
      final result = await _authRepository.requestOtp(event.phoneNumber);
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
          await _authRepository.getAcessToken(event.phoneNumber, event.otp);
      emit(AuthLoadedState(result));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
