
import 'package:clean_architect/features/common/constants/pref_constants.dart';
import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/app_constants.dart';
import '../api/api_client.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(String email, String password){
    var body = {"email": email, "password": password };
    return apiClient.postData(AppConstants.POST_LOGIN, body, null);
  }

  updateLocalToken(LoginModelEntity loginModelEntity){
    sharedPreferences.setString(Constants.keyAccessToken, loginModelEntity.accessToken ?? '');
  }
}