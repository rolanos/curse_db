part of 'auth_bloc.dart';

class AuthEvent {
  const AuthEvent();
}

class SignInWithAdmin extends AuthEvent {}

class SignInWithWorker extends AuthEvent {}
