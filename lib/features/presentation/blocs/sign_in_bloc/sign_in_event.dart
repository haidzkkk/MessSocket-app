abstract class SignInEvent{}
class TogglePasswordVisibility extends SignInEvent{}
class PressLogin extends SignInEvent{
  final String username;
  final String password;

  PressLogin(this.username, this.password);
}