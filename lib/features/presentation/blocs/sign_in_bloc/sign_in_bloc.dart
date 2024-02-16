import 'package:bloc/bloc.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent,LoginState>{
  SignInBloc() : super(const LoginState()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isShowPassword: event.isShowPassword));
    });
    on<PressLogin>((event, emit) {
      emit(state.copyWith(username: event.username,password: event.password));
    });
    on<OnEmailChange>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<OnPasswordChange>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}