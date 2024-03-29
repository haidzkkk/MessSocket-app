import '../../data/models/request/language_model.dart';
import '../../presentation/components/utility/images.dart';

class AppConstants{
  /// api
  static const String BASE_URL = 'http://192.168.1.10:3000';
  static const String GET_CURRENT_USER = '/api/getCurrentUser';
  static const String POST_LOGIN = '/api/signin';
  /// sharepreferent key
  static const String TOKEN = 'token';
  static const String LANGUAGE_CODE = 'language_code';
  static const String MODULE_ID = 'moduleId';
  static const String LOCALIZATION_KEY = 'X-localization';
  /// language
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.logo,
        languageName: 'Việt Nam',
        countryCode: 'VN',
        languageCode: 'vi'),
    LanguageModel(
        imageUrl: Images.logo,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
  ];
}