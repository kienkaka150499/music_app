import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/fake_data.dart';
import 'package:music_app/models/song.dart';

import '../models/assets.dart';

class PlayScreen extends StatefulWidget {
  static const String routeName = "/PlayScreen";
  Song? song;

  PlayScreen({this.song});

  @override
  State<StatefulWidget> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
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
        ),
        body: SafeArea(
          child: Center(
            child: Container(
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
                      style: const TextStyle(color: Colors.white, fontSize: 15)),
                  SizedBox(
                    height: ScreenUtil().setHeight(80),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite,color: Colors.pink,size: 40,),
                      SizedBox(
                        width: ScreenUtil().setWidth(150),
                      ),
                      Icon(Icons.file_download_outlined,color: Colors.white,size: 40,),
                      SizedBox(
                        width: ScreenUtil().setWidth(150),
                      ),
                      SvgPicture.asset(Assets.commentIcon,color: Colors.white,width: 40,height: 40,),
                      SizedBox(
                        width: ScreenUtil().setWidth(150),
                      ),
                      SvgPicture.asset(Assets.threeDotsIcon,color: Colors.white,width: 40,height: 40,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
