import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({required this.active, super.key});

  final active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: active ? 20 : 10,
      decoration: BoxDecoration(
        color: active ? AppTheme.primary : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
