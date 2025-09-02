import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  Color? color;

  LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color ?? AppTheme.primary,
      strokeWidth: 2.0,
    ));
  }
}
