import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/auth_request_model.dart';
import '../../data/repos/auth_repo.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterCubit(this.authRepo) : super(RegisterInitialState());

  Future register() async {
    emit(RegisterLoadingState());
    final result = await authRepo.register(
      AuthRequestModel(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      ),
    );
    result.fold(
      (failure) => emit(RegisterErrorState(failure.errorMessage)),
      (userModel) => emit(RegisterSuccessState(userModel)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
