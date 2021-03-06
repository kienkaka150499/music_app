import 'models/song.dart';

class FakeSong{
  List<Song> songs=[
    Song(songId: 1,imageUrl: 'assets/images/vi_me_anh_bat_chia_tay_poster.jpg',songName: 'Vì mẹ anh bắt chia tay',singer: 'Miu Lê, Karik, Châu Đăng Khoa',songTime: const Duration(minutes: 5,seconds: 26)),
    Song(songId: 2,imageUrl: 'assets/images/co_khong_giu_mat_dung_tim_poster.jpg',songName: 'Có không giữ, mất...',singer: 'Trúc Nhân',songTime: const Duration(seconds: 326)),
    Song(songId: 3,imageUrl: 'assets/images/vi_me_anh_bat_chia_tay_poster.jpg',songName: 'Vì mẹ anh bắt chia tay',singer: 'Miu Lê, Karik, Châu Đăng Khoa',songTime: const Duration(seconds: 326)),
    Song(songId: 4,imageUrl: 'assets/images/co_khong_giu_mat_dung_tim_poster.jpg',songName: 'Có không giữ, mất...',singer: 'Trúc Nhân',songTime: const Duration(seconds: 326)),
    Song(songId: 5,imageUrl: 'assets/images/vi_me_anh_bat_chia_tay_poster.jpg',songName: 'Vì mẹ anh bắt chia tay',singer: 'Miu Lê, Karik, Châu Đăng Khoa',songTime: const Duration(seconds: 326)),
    Song(songId: 6,imageUrl: 'assets/images/co_khong_giu_mat_dung_tim_poster.jpg',songName: 'Có không giữ, mất...',singer: 'Trúc Nhân',songTime: const Duration(seconds: 326)),
  ];
}

const FAKE_CATEGORIES=[
  'POP',
  'Ballad',
  'EDM',
  'Bolero',
  'Rock',
  'Lo-fi',
  'Nhạc sống',
  'Nhạc trẻ',
  'Trending'
];