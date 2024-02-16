import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  final String username;
  final String password;
  final bool isShowPassword;

  const LoginState({
    this.username = '.',
    this.password = '.',
    this.isShowPassword = false
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isShowPassword
  }){
    return LoginState(
      username: username ?? this.username,
      password:  password ?? this.password,
      isShowPassword: isShowPassword ?? this.isShowPassword
    );
  }

  @override
  List<Object?> get props => [username,password,isShowPassword];
}
