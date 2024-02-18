import 'package:equatable/equatable.dart';

class LoginModelEntity extends Equatable {
  const LoginModelEntity({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object> get props => [accessToken!, refreshToken!];

  factory LoginModelEntity.fromJson(dynamic json) {
    return LoginModelEntity(
      accessToken : json['accessToken'],
      refreshToken : json['refreshToken'],

    );
  }
}
