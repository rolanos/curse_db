// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  UserStatus userStatus;
  AuthState({
    this.userStatus = UserStatus.worker,
  });
}
