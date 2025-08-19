import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/supabase_auth_failure.dart';
import '../../../../core/errors/supabase_database_failure.dart';
import '../models/auth_request_model.dart';
import '../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseClient client;

  AuthRepoImpl(this.client);

  @override
  Future<Either<Failure, UserModel>> register(
    AuthRequestModel authRequestModel,
  ) async {
    try {
      final response = await client.auth.signUp(
        password: authRequestModel.password,
        email: authRequestModel.email,
      );
      final userModel = UserModel(
        id: response.user?.id ?? '',
        name: authRequestModel.name ?? 'unknown',
        email: authRequestModel.email,
      );
      return Right(userModel);
    } catch (error) {
      if (error is AuthApiException) {
        return Left(SupabaseAuthFailure.fromAuthException(error));
      }
      return Left(SupabaseAuthFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createUser(UserModel userModel) async {
    try {
      await client.from('profiles').insert(userModel.toJson());
      return const Right(unit);
    } catch (error) {
      return Left(SupabaseDatabaseFailure(error.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> login(AuthRequestModel authRequestModel) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: authRequestModel.email,
        password: authRequestModel.password,
      );
      return Right(response.user?.id ?? '');
    } catch (error) {
      if (error is AuthApiException) {
        return Left(SupabaseAuthFailure.fromAuthException(error));
      }
      return Left(SupabaseAuthFailure(error.toString()));
    }
  }
}
