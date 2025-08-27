abstract class LogoutStates {}

class LogoutInitial extends LogoutStates {}

class LogoutLoading extends LogoutStates {}

class LogoutSuccess extends LogoutStates {}

class LogoutFailure extends LogoutStates {
  final String errorMessage;
  
  LogoutFailure(this.errorMessage);
}
