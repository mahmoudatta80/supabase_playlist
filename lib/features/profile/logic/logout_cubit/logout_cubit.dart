import 'package:chat_app/core/utils/app_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_constants.dart';
import '../../data/repos/profile_repo.dart';
import 'logout_states.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  final ProfileRepo profileRepo;
  LogoutCubit(this.profileRepo) : super(LogoutInitial());

  Future logout() async {
    emit(LogoutLoading());
    final result = await profileRepo.logout();
    result.fold((failure) => emit(LogoutFailure(failure.errorMessage)), (_) {
      _removeToken();
      emit(LogoutSuccess());
    });
  }

  void _removeToken() async {
    await AppSecureStorage().removeData(AppConstants.tokenKey);
  }
}
