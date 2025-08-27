import 'package:chat_app/features/profile/logic/fetch_profile_cubit/fetch_profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/profile_repo.dart';

class FetchProfileCubit extends Cubit<FetchProfileStates> {
  final ProfileRepo profileRepo;
  FetchProfileCubit(this.profileRepo) : super(FetchProfileInitial());

  Future<void> fetchProfile() async {
    emit(FetchProfileLoading());
    final result = await profileRepo.fetchProfile();
    result.fold(
      (failure) => emit(FetchProfileFailure(failure.errorMessage)),
      (userModel) => emit(FetchProfileSuccess(userModel)),
    );
  }
}
