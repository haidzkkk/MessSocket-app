import 'package:clean_architect/features/common/constants/app_constants.dart';
import 'package:clean_architect/features/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  SplashRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getCurrentUser(){
    return apiClient.getData(AppConstants.GET_CURRENT_USER);
  }
}