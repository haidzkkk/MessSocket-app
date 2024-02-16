abstract class SignInEvent{}
class TogglePasswordVisibility extends SignInEvent{
  final bool isShowPassword;

  TogglePasswordVisibility({required this.isShowPassword});
}

class OnEmailChange extends SignInEvent{
  final String username;

  OnEmailChange(this.username);
}

class OnPasswordChange extends SignInEvent{
  final String password;

  OnPasswordChange(this.password);
}


class PressLogin extends SignInEvent{
  final String username;
  final String password;

  PressLogin(this.username, this.password);
}