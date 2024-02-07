import 'package:flutter/material.dart';

extension ShowSnackbarGlobalKeyScaffoldStateExtension
on GlobalKey<ScaffoldState> {
  void showSnackBar(
      String message, [
        Duration duration = const Duration(seconds: 2),
      ]) {
  }
}

extension ShowSnackBarBuildContextExtension on BuildContext {
  void showSnackBar(
      String message, [
        Duration duration = const Duration(seconds: 2),
      ]) {
  }
}
