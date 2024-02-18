import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  final String username;
  final String password;
  final bool isShowPassword;
  final LoginViewState? state;

  const LoginState({
    this.username = '.',
    this.password = '.',
    this.isShowPassword = false,
    this.state
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isShowPassword,
    LoginViewState? state,
  }){
    return LoginState(
      username: username ?? this.username,
      password:  password ?? this.password,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      state: state
    );
  }

  @override
  List<Object?> get props => [username,password,isShowPassword,state];
}


sealed class LoginViewState extends Equatable {}
class LoginSuccess extends LoginViewState {
  LoginSuccess();
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginViewState {
  LoginFailed({this.message});

  String? message;
  @override
  List<Object> get props => [message ?? ""];
}

class LoginLoading extends LoginViewState {
  LoginLoading();
  @override
  List<Object> get props => [];
}