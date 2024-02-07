import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.title = 'Login',
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () => onPressed!,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}
