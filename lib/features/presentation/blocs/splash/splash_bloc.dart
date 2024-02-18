import 'dart:async';
import 'package:clean_architect/features/data/repositories/splash_repo.dart';
import 'package:clean_architect/features/presentation/blocs/splash/splash_event.dart';
import 'package:clean_architect/features/presentation/components/utility/delay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'splash_state.dart';
import 'package:get/get.dart';

class SplashBloc extends Bloc<SplashEvent,SplashState>{
  final SplashRepo repo = GetIt.instance.get<SplashRepo>();
  SplashBloc() : super(Loading()) {
    on<LoadingEvent>(getCurrentUser);
  }
  Future<int> getCurrentUser(SplashEvent event, Emitter<SplashState> emit) async {
    Response response = await repo.getCurrentUser();
    delay(1000);
    if(response.statusCode == 200){
      emit(Success());
    }
    else{
      emit(Failure());
    }
    return response.statusCode!;
  }
}