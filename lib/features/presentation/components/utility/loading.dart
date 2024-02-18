
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_resource.dart';

extension ShowLoadingDialogBuildContextExtension on BuildContext{
  showLoadingDialog(){
    showDialog(
        context: this,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.1),
        builder: (context){
          return const AlertDialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            )
          );
        }
    );
  }
}