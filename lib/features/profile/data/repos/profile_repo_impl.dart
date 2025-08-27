import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/errors/supabase_auth_failure.dart';
import 'package:chat_app/core/errors/supabase_database_failure.dart';
import 'package:chat_app/core/utils/app_constants.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/app_secure_storage.dart';
import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final SupabaseClient client;

  ProfileRepoImpl(this.client);

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await client.auth.signOut();
      return const Right(unit);
    } catch (error) {
      if (error is AuthApiException) {
        return Left(SupabaseAuthFailure.fromAuthException(error));
      }
      return Left(SupabaseAuthFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchProfile() async {
    try {
      final response = await client
          .from('profiles')
          .select()
          .eq(
            'id',
            await AppSecureStorage().getData(AppConstants.tokenKey) ?? '',
          )
          .single();
      final userModel = UserModel.fromJson(response);
      return Right(userModel);
    } catch (error) {
      return Left(SupabaseDatabaseFailure(error.toString()));
    }
  }
}
