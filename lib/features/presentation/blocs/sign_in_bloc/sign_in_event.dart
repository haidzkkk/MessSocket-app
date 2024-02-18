import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';

abstract class SignInEvent{}
class TogglePasswordVisibility extends SignInEvent{
  final bool isShowPassword;

  TogglePasswordVisibility({required this.isShowPassword});
}

class PressLogin extends SignInEvent{
  final String username;
  final String password;

  PressLogin(this.username, this.password);
}

class UpdateLocalToken extends SignInEvent{
  final LoginModelEntity data;

  UpdateLocalToken(this.data);
}