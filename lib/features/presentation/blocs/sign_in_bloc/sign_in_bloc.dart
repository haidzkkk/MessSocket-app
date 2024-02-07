import 'package:bloc/bloc.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc() : super(PasswordHiddenState()) {
    on<TogglePasswordVisibility>((event, emit) {
      if(state is SignInInitial){
        emit(PasswordVisibilityState());
      }
     else if(state is PasswordVisibilityState){
       emit(PasswordHiddenState());
     }
     else{
       emit(PasswordVisibilityState());
     }
    });
    on<PressLogin>((event, emit) {
      if(event.username.isEmpty){
        emit(EmptyUsername());
      }
      else if(event.password.isEmpty){
        emit(EmptyPassword());
      }
      else{
        emit(LoadingLogin());
      }
    });
  }
}