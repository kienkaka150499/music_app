import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/fake_data.dart';
import 'package:music_app/widgets/side_menu.dart';

import '../models/assets.dart';
import '../models/song.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShowMenu = false;
  String currentSelectTab = Assets.homeIcon;

  Widget _buildHeader() {
    return SizedBox(
      height: ScreenUtil().setHeight(140),
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.08)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                    child: SvgPicture.asset(
                      Assets.circleIcon,
                      width: ScreenUtil().setWidth(100),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(40),
                        right: ScreenUtil().setWidth(40)),
                    child: SizedBox(
                      height: ScreenUtil().setHeight(140),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: ('Search'),
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setWidth(60),
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ))
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(40), 0, ScreenUtil().setWidth(20), 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  Assets.avtImg,
                  width: ScreenUtil().setWidth(140),
                  height: ScreenUtil().setHeight(120),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTrending() {
    List<Song> songs = FakeSong().songs;
    return SizedBox(
      width: 900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 50, bottom: 20),
            child: Text(
              'Top Trending',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(
            width: 900,
            height: 300,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  //Song song=songs[index] as Song;
                  return Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                songs[index].imageUrl,
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                              left: 5,
                              bottom: 10,
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                      Assets.playIcon,
                                      width: 60,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          songs[index].songName,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(songs[index].singer,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15))
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildSearchKeyWordCategories() {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 50, bottom: 20),
            child: Text(
              'Search key word',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(1000),
            height: ScreenUtil().setWidth(300),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: ScreenUtil().setWidth(400),
                  childAspectRatio: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12),
              itemCount: FAKE_CATEGORIES.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      FAKE_CATEGORIES[index],
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecentlySong() {
    List<Song> songs = FakeSong().songs;
    return SizedBox(
      width: 900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 50, bottom: 20),
            child: Text(
              'Recently',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(
            width: 900,
            height: ScreenUtil().setHeight(600),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  //Song song=songs[index] as Song;
                  return Container(
                      height: ScreenUtil().setHeight(180),
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.purple.withOpacity(0.5),
                            ),
                            height: ScreenUtil().setHeight(120),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(15),
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      songs[index].songName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(songs[index].singer,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13))
                                  ],
                                )),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/PlayScreen',arguments: {'songs': songs[index]});
                                  },
                                  icon: SvgPicture.asset(
                                    Assets.playMiniIcon,
                                    width: ScreenUtil().setWidth(80),
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                                SvgPicture.asset(
                                  Assets.threeDotsIcon,
                                  width: ScreenUtil().setWidth(100),
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                }),
          )
        ],
      ),
    );
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: const Text('Music App'),
          centerTitle: true,
          leading: _buildOpenMenuButton()),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                  left: isShowMenu ? ScreenUtil().setWidth(200) : 10),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: double.infinity,
              color: Colors.purple.withOpacity(0.7),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildTrending(),
                    _buildSearchKeyWordCategories(),
                    _buildRecentlySong()
                  ],
                ),
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
            ),
            // Positioned(
            //     left: ScreenUtil().setWidth(isShowMenu ? 45 : 0),
            //     bottom: ScreenUtil().setHeight(45),
            //     child: isShowMenu? _buildOpenMenuButton(): Container(
            //       color: Colors.purple,
            //       child: _buildOpenMenuButton(),
            //     ))
          ],
        ),
      ),
    );
  }
}
