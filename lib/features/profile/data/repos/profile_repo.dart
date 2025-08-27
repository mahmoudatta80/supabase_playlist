import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, UserModel>> fetchProfile();
}
