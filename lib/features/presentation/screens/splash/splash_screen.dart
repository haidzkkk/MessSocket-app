import 'package:clean_architect/features/presentation/blocs/splash/splash_event.dart';
import 'package:clean_architect/features/presentation/blocs/splash/splash_state.dart';
import 'package:clean_architect/features/presentation/components/utility/color_resource.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../di/InjectionContainer.dart';
import '../../blocs/splash/splash_bloc.dart';
import '../../components/utility/images.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.getPrimaryColor(),// Change to your desired color
    ));
    return Scaffold(
      backgroundColor: ColorResources.getPrimaryColor(),
      body: BlocProvider(
        create: (context) => sl<SplashBloc>()..add(LoadingEvent()),
        child: BlocListener<SplashBloc,SplashState>(
          listener: (context,state){
            if(state is Success){
              Get.off(() => HomeScreen());
            }
            if(state is Failure){
              Get.off(() => LoginScreen());
            }
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 40),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Image.asset(Images.logo),
            ),
          ),
        ),
      )
    );
  }
}
