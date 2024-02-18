import 'package:bloc/bloc.dart';
import 'package:clean_architect/features/data/repositories/auth_repo.dart';
import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:clean_architect/features/presentation/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:clean_architect/features/presentation/components/utility/delay.dart';

class SignInBloc extends Bloc<SignInEvent,LoginState>{
    AuthRepo repo;

    SignInBloc({required this.repo}) : super(const LoginState()) {

    on<PressLogin>(_login);
    on<TogglePasswordVisibility>((event, emit) => emit(state.copyWith(isShowPassword: event.isShowPassword)));
    on<UpdateLocalToken>((event, emit) => repo.updateLocalToken(event.data));

  }

  Future<void> _login(event, emit) async{
      if(event.username.isEmpty || event.password.isEmpty){
        return emit(state.copyWith(username: event.username, password: event.password));
      }
      if(state.state is LoginLoading) return;
      emit(state.copyWith(state: LoginLoading(), username: event.username, password: event.password));

      try{
        await delay(1000);
        var response = await repo.login(event.username, event.password);
        if(response.statusCode != 200){
          emit(state.copyWith(state: LoginFailed(message: response.body["messages"].toString())));
        }else{
          add(UpdateLocalToken(LoginModelEntity.fromJson(response.body)));
          emit(state.copyWith(state: LoginSuccess()));
        }

      }catch(error){
        emit(state.copyWith(state: LoginFailed(message: "Có lỗi sảy ra")));
      }
    }
}