import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarUnselected extends StatelessWidget {
  String imageName;

  NavBarUnselected({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$imageName.svg',
      height: 28,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
