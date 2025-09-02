import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';

class NavBarSelected extends StatelessWidget {
  String imageName;

  NavBarSelected({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imageName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
