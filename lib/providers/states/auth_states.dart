import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();

  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();

  @override
  List<Object> get props => [];
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
