import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repo/repositories.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository) : super(ProfileLoadingState()) {
    on<GetProfileInfoEvent>(_getProfileInfoEvent);
    on<UpdateProfileEvent>(_updateProfileEvent);
  }

  void _getProfileInfoEvent(event, emit) async {
    emit(ProfileLoadingState());
    try {
      final result = await _profileRepository.getProfileInfo();
      emit(ProfileLoadedState(result));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  void _updateProfileEvent(event, emit) async {
    emit(ProfileLoadingState());
    try {
      final result = await _profileRepository.updateProfileInfo(event.newName);
      emit(ProfileLoadedState(result));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}
