abstract class SignInState{}

class SignInInitial extends SignInState{}

class PasswordVisibilityState extends SignInState{}

class PasswordHiddenState extends SignInState{}

class EmptyUsername extends SignInState{}

class EmptyPassword extends SignInState{}

class LoadingLogin extends SignInState{}
