import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key,
      required this.icon,
      required this.currentSelect,
      required this.onPressed})
      : super(key: key);

  final String icon;
  final String currentSelect;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12), vertical: ScreenUtil().setHeight(22)),
      child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            color: currentSelect == icon ? Colors.white : Colors.grey,
            height: ScreenUtil().setHeight(66),
          )),
    );
  }
}
