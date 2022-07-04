import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/screen/home_screen.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(1080, 1920 ),
        builder: (context, widget) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: Colors.purple),
              home: HomeScreen(),
              builder: (context, widget) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!);
              },
            ));
  }
}
