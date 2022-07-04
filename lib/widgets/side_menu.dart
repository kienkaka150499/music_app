import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/widgets/menu_button.dart';

import '../models/assets.dart';

class SideMenu extends StatefulWidget {
  SideMenu(
      {Key? key,
      required this.currentSelectTab,
      required this.selectTabCallBack})
      : super(key: key);

  String currentSelectTab;

  Function(String) selectTabCallBack;

  @override
  State<StatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void updateButton(String selectTab) {
    setState(() {
      widget.currentSelectTab = selectTab;
      widget.selectTabCallBack(selectTab);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(45)),
          child: SvgPicture.asset(
            Assets.spotifyLogo,
            width: ScreenUtil().setWidth(120),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
        ),
        Expanded(
            child: Column(
              children: [
            MenuButton(
                icon: Assets.homeIcon,
                currentSelect: widget.currentSelectTab,
                onPressed: () {
                  setState(() {
                    updateButton(Assets.homeIcon);
                  });
                }),
            MenuButton(
                icon: Assets.cloudIcon,
                currentSelect: widget.currentSelectTab,
                onPressed: () {
                  setState(() {
                    updateButton(Assets.cloudIcon);
                  });
                }),
            MenuButton(
                icon: Assets.clockIcon,
                currentSelect: widget.currentSelectTab,
                onPressed: () {
                  setState(() {
                    updateButton(Assets.clockIcon);
                  });
                }),
            MenuButton(
                icon: Assets.microphoneIcon,
                currentSelect: widget.currentSelectTab,
                onPressed: () {
                  setState(() {
                    updateButton(Assets.microphoneIcon);
                  }
                  );
                }
                ),
          ],
        )
        )
      ],
    );
  }
}
