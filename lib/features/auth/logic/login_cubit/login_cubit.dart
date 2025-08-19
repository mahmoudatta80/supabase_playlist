import 'package:chat_app/features/auth/logic/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_secure_storage.dart';
import '../../data/models/auth_request_model.dart';
import '../../data/repos/auth_repo.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this.authRepo) : super(LoginInitialState());

  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      AuthRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((failure) => emit(LoginErrorState(failure.errorMessage)), (
      token,
    ) {
      _saveToken(token);
      emit(LoginSuccessState(token));
    });
  }

  void _saveToken(String token) async {
    await AppSecureStorage().setData(key: AppConstants.tokenKey, value: token);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
