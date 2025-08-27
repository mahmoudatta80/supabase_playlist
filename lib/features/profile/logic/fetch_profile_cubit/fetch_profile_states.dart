import '../../../auth/data/models/user_model.dart';

abstract class FetchProfileStates {}

class FetchProfileInitial extends FetchProfileStates {}

class FetchProfileLoading extends FetchProfileStates {}

class FetchProfileSuccess extends FetchProfileStates {
  final UserModel userModel;

  FetchProfileSuccess(this.userModel);
}

class FetchProfileFailure extends FetchProfileStates {
  final String errorMessage;

  FetchProfileFailure(this.errorMessage);
}
