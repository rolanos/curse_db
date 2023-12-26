import 'package:bloc/bloc.dart';
import 'package:curse_db/core/enums.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<SignInWithAdmin>(
        (event, emit) => emit(AuthState(userStatus: UserStatus.admin)));
    on<SignInWithWorker>(
        (event, emit) => emit(AuthState(userStatus: UserStatus.worker)));
  }
}
