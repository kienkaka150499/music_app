import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/models/song.dart';

import '../models/assets.dart';
import '../widgets/side_menu.dart';

class PlayScreen extends StatefulWidget {
  static const String routeName = "/PlayScreen";
  Song? song;

  PlayScreen({this.song});

  late int minutes = song!.songTime.inMinutes;
  late int second = song!.songTime.inSeconds - song!.songTime.inMinutes * 60;

  @override
  State<StatefulWidget> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with TickerProviderStateMixin {
  bool isShuffle = false;
  bool isLoop = false;
  bool isShowMenu = false;
  String currentSelectTab = Assets.homeIcon;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(minutes: 5, seconds: 13));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    if (isLoop) {
      controller.repeat();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget _buildOpenMenuButton() {
    return IconButton(
      icon: SvgPicture.asset(
        isShowMenu ? Assets.chevronLeftIcon : Assets.chevronRightIcon,
        color: Colors.white,
        height: ScreenUtil().setHeight(66),
      ),
      onPressed: () {
        setState(() {
          isShowMenu = !isShowMenu;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Song>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Song>?;
    widget.song = arguments!['songs'];
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Play screen'),
          backgroundColor: Colors.purple.withOpacity(0.4),
          centerTitle: true,
          leading: _buildOpenMenuButton(),
        ),
        body: SafeArea(
          child: Stack(children: [
            AnimatedContainer(
              duration: const Duration(seconds: 300),
              padding: EdgeInsets.only(
                  left: isShowMenu ? ScreenUtil().setWidth(200) : 10),
              alignment: Alignment.topLeft,
              color: Colors.black.withOpacity(0.8),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(150),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      widget.song!.imageUrl,
                      width: ScreenUtil().setWidth(800),
                      height: ScreenUtil().setHeight(680),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(80),
                  ),
                  Text(
                    widget.song!.songName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Text(widget.song!.singer,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                  SizedBox(
                    height: ScreenUtil().setHeight(80),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 40,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(150),
                      ),
                      const Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(150),
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(150),
                      ),
                      SvgPicture.asset(
                        Assets.threeDotsIcon,
                        color: Colors.white,
                        width: 40,
                        height: 40,
                      )
                    ],
                  ),
                  SizedBox(
                      //width: ScreenUtil().setWidth(800),
                      height: ScreenUtil().setHeight(120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              '${controller.duration!.inMinutes}:${controller.duration!.inSeconds - controller.duration!.inMinutes * 60}'),
                          SizedBox(width: ScreenUtil().setWidth(20)),
                          Container(
                            width: ScreenUtil().setWidth(400),
                            child: LinearProgressIndicator(
                              value: animation.value,
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(20)),
                          Text('${widget.minutes}:${widget.second}'),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isShuffle = !isShuffle;
                          });
                        },
                        icon: isShuffle
                            ? SvgPicture.asset(
                                Assets.shuffleIcon,
                                color: Colors.white,
                                width: 40,
                                height: 40,
                              )
                            : SvgPicture.asset(
                                Assets.sweepIcon,
                                color: Colors.white,
                                width: 40,
                                height: 40,
                              ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(100),
                      ),
                      SvgPicture.asset(
                        Assets.previousIcon,
                        color: Colors.white,
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(100),
                      ),
                      SvgPicture.asset(
                        Assets.playMiniIcon,
                        color: Colors.white,
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(100),
                      ),
                      SvgPicture.asset(
                        Assets.nextIcon,
                        color: Colors.white,
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(90),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isLoop = !isLoop;
                          });
                        },
                        icon: SvgPicture.asset(
                          Assets.loopIcon,
                          color: isLoop
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: ScreenUtil().setWidth(isShowMenu ? 200 : 0),
              color: Colors.purple,
              child: SideMenu(
                currentSelectTab: currentSelectTab,
                selectTabCallBack: (tab) {
                  currentSelectTab = tab;
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
