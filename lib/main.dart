import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTime = '';
  List<String> _timeDiffs = [];
  Timer? _timer;
  int? _closestTargetIndex;
  List<String> _selectedTimes = [];

  List<TimeOfDay> targetTimes = [
    TimeOfDay(hour: 5, minute: 9),
    TimeOfDay(hour: 5, minute: 27),
    TimeOfDay(hour: 5, minute: 37),
    TimeOfDay(hour: 5, minute: 46),
    TimeOfDay(hour: 5, minute: 58),
    TimeOfDay(hour: 6, minute: 10),
    TimeOfDay(hour: 6, minute: 17),
    TimeOfDay(hour: 6, minute: 25),
    TimeOfDay(hour: 6, minute: 32),
    TimeOfDay(hour: 6, minute: 36),
    TimeOfDay(hour: 6, minute: 41),
    TimeOfDay(hour: 6, minute: 45),
    TimeOfDay(hour: 6, minute: 50),
    TimeOfDay(hour: 6, minute: 56),
    TimeOfDay(hour: 7, minute: 0),
    TimeOfDay(hour: 7, minute: 3),
    TimeOfDay(hour: 7, minute: 7),
    TimeOfDay(hour: 7, minute: 12),
    TimeOfDay(hour: 7, minute: 17),
    TimeOfDay(hour: 7, minute: 22),
    TimeOfDay(hour: 7, minute: 28),
    TimeOfDay(hour: 7, minute: 33),
    TimeOfDay(hour: 7, minute: 37),
    TimeOfDay(hour: 7, minute: 42),
    TimeOfDay(hour: 7, minute: 48),
    TimeOfDay(hour: 7, minute: 52),
    TimeOfDay(hour: 7, minute: 57),
    TimeOfDay(hour: 8, minute: 1),
    TimeOfDay(hour: 8, minute: 4),
    TimeOfDay(hour: 8, minute: 8),
    TimeOfDay(hour: 8, minute: 11),
    TimeOfDay(hour: 8, minute: 14),
    TimeOfDay(hour: 8, minute: 17),
    TimeOfDay(hour: 8, minute: 19),
    TimeOfDay(hour: 8, minute: 22),
    TimeOfDay(hour: 8, minute: 25),
    TimeOfDay(hour: 8, minute: 28),
    TimeOfDay(hour: 8, minute: 31),
    TimeOfDay(hour: 8, minute: 34),
    TimeOfDay(hour: 8, minute: 37),
    TimeOfDay(hour: 8, minute: 39),
    TimeOfDay(hour: 8, minute: 42),
    TimeOfDay(hour: 8, minute: 47),
    TimeOfDay(hour: 8, minute: 49),
    TimeOfDay(hour: 8, minute: 52),
    TimeOfDay(hour: 8, minute: 54),
    TimeOfDay(hour: 8, minute: 57),
    TimeOfDay(hour: 8, minute: 59),
    TimeOfDay(hour: 9, minute: 2),
    TimeOfDay(hour: 9, minute: 5),
    TimeOfDay(hour: 9, minute: 8),
    TimeOfDay(hour: 9, minute: 11),
    TimeOfDay(hour: 9, minute: 14),
    TimeOfDay(hour: 9, minute: 17),
    TimeOfDay(hour: 9, minute: 20),
    TimeOfDay(hour: 9, minute: 23),
    TimeOfDay(hour: 9, minute: 26),
    TimeOfDay(hour: 9, minute: 29),
    TimeOfDay(hour: 9, minute: 32),
    TimeOfDay(hour: 9, minute: 35),
    TimeOfDay(hour: 9, minute: 38),
    TimeOfDay(hour: 9, minute: 41),
    TimeOfDay(hour: 9, minute: 44),
    TimeOfDay(hour: 9, minute: 49),
    TimeOfDay(hour: 9, minute: 53),
    TimeOfDay(hour: 9, minute: 59),
    TimeOfDay(hour: 10, minute: 4),
    TimeOfDay(hour: 10, minute: 10),
    TimeOfDay(hour: 10, minute: 16),
    TimeOfDay(hour: 10, minute: 22),
    TimeOfDay(hour: 10, minute: 27),
    TimeOfDay(hour: 10, minute: 32),
    TimeOfDay(hour: 10, minute: 38),
    TimeOfDay(hour: 10, minute: 43),
    TimeOfDay(hour: 10, minute: 49),
    TimeOfDay(hour: 10, minute: 54),
    TimeOfDay(hour: 10, minute: 59),
    TimeOfDay(hour: 11, minute: 4),
    TimeOfDay(hour: 11, minute: 10),
    TimeOfDay(hour: 11, minute: 16),
    TimeOfDay(hour: 11, minute: 22),
    TimeOfDay(hour: 11, minute: 28),
    TimeOfDay(hour: 11, minute: 34),
    TimeOfDay(hour: 11, minute: 40),
    TimeOfDay(hour: 11, minute: 46),
    TimeOfDay(hour: 11, minute: 52),
    TimeOfDay(hour: 12, minute: 4),
    TimeOfDay(hour: 12, minute: 10),
    TimeOfDay(hour: 12, minute: 16),
    TimeOfDay(hour: 12, minute: 22),
    TimeOfDay(hour: 12, minute: 28),
    TimeOfDay(hour: 12, minute: 34),
    TimeOfDay(hour: 12, minute: 40),
    TimeOfDay(hour: 12, minute: 46),
    TimeOfDay(hour: 12, minute: 52),
    TimeOfDay(hour: 12, minute: 58),
    TimeOfDay(hour: 13, minute: 4),
    TimeOfDay(hour: 13, minute: 10),
    TimeOfDay(hour: 13, minute: 16),
    TimeOfDay(hour: 13, minute: 22),
    TimeOfDay(hour: 13, minute: 28),
    TimeOfDay(hour: 13, minute: 34),
    TimeOfDay(hour: 13, minute: 40),
    TimeOfDay(hour: 13, minute: 46),
    TimeOfDay(hour: 13, minute: 52),
    TimeOfDay(hour: 13, minute: 58),
    TimeOfDay(hour: 14, minute: 4),
    TimeOfDay(hour: 14, minute: 10),
    TimeOfDay(hour: 14, minute: 16),
    TimeOfDay(hour: 14, minute: 22),
    TimeOfDay(hour: 14, minute: 28),
    TimeOfDay(hour: 14, minute: 34),
    TimeOfDay(hour: 14, minute: 40),
    TimeOfDay(hour: 14, minute: 46),
    TimeOfDay(hour: 14, minute: 52),
    TimeOfDay(hour: 14, minute: 58),
    TimeOfDay(hour: 15, minute: 4),
    TimeOfDay(hour: 15, minute: 10),
    TimeOfDay(hour: 15, minute: 16),
    TimeOfDay(hour: 15, minute: 22),
    TimeOfDay(hour: 15, minute: 28),
    TimeOfDay(hour: 15, minute: 34),
    TimeOfDay(hour: 15, minute: 40),
    TimeOfDay(hour: 15, minute: 46),
    TimeOfDay(hour: 15, minute: 52),
    TimeOfDay(hour: 15, minute: 58),
    TimeOfDay(hour: 16, minute: 4),
    TimeOfDay(hour: 16, minute: 10),
    TimeOfDay(hour: 16, minute: 16),
    TimeOfDay(hour: 16, minute: 22),
    TimeOfDay(hour: 16, minute: 28),
    TimeOfDay(hour: 16, minute: 34),
    TimeOfDay(hour: 16, minute: 40),
    TimeOfDay(hour: 16, minute: 46),
    TimeOfDay(hour: 16, minute: 52),
    TimeOfDay(hour: 16, minute: 58),
    TimeOfDay(hour: 17, minute: 0),
    TimeOfDay(hour: 17, minute: 5),
    TimeOfDay(hour: 17, minute: 10),
    TimeOfDay(hour: 17, minute: 15),
    TimeOfDay(hour: 17, minute: 20),
    TimeOfDay(hour: 17, minute: 30),
    TimeOfDay(hour: 17, minute: 35),
    TimeOfDay(hour: 17, minute: 40),
    TimeOfDay(hour: 17, minute: 45),
    TimeOfDay(hour: 17, minute: 49),
    TimeOfDay(hour: 17, minute: 53),
    TimeOfDay(hour: 17, minute: 56),
    TimeOfDay(hour: 18, minute: 1),
    TimeOfDay(hour: 18, minute: 5),
    TimeOfDay(hour: 18, minute: 9),
    TimeOfDay(hour: 18, minute: 13),
    TimeOfDay(hour: 18, minute: 17),
    TimeOfDay(hour: 18, minute: 21),
    TimeOfDay(hour: 18, minute: 25),
    TimeOfDay(hour: 18, minute: 29),
    TimeOfDay(hour: 18, minute: 33),
    TimeOfDay(hour: 18, minute: 37),
    TimeOfDay(hour: 18, minute: 41),
    TimeOfDay(hour: 18, minute: 45),
    TimeOfDay(hour: 18, minute: 49),
    TimeOfDay(hour: 18, minute: 52),
    TimeOfDay(hour: 18, minute: 56),
    TimeOfDay(hour: 19, minute: 1),
    TimeOfDay(hour: 19, minute: 6),
    TimeOfDay(hour: 19, minute: 10),
    TimeOfDay(hour: 19, minute: 14),
    TimeOfDay(hour: 19, minute: 18),
    TimeOfDay(hour: 19, minute: 22),
    TimeOfDay(hour: 19, minute: 26),
    TimeOfDay(hour: 19, minute: 30),
    TimeOfDay(hour: 19, minute: 34),
    TimeOfDay(hour: 19, minute: 38),
    TimeOfDay(hour: 19, minute: 42),
    TimeOfDay(hour: 19, minute: 46),
    TimeOfDay(hour: 19, minute: 51),
    TimeOfDay(hour: 19, minute: 55),
    TimeOfDay(hour: 20, minute: 1),
    TimeOfDay(hour: 20, minute: 5),
    TimeOfDay(hour: 20, minute: 10),
    TimeOfDay(hour: 20, minute: 15),
    TimeOfDay(hour: 20, minute: 20),
    TimeOfDay(hour: 20, minute: 25),
    TimeOfDay(hour: 20, minute: 30),
    TimeOfDay(hour: 20, minute: 35),
    TimeOfDay(hour: 20, minute: 40),
    TimeOfDay(hour: 20, minute: 45),
    TimeOfDay(hour: 20, minute: 50),
    TimeOfDay(hour: 20, minute: 55),
    TimeOfDay(hour: 21, minute: 1),
    TimeOfDay(hour: 21, minute: 7),
    TimeOfDay(hour: 21, minute: 12),
    TimeOfDay(hour: 21, minute: 17),
    TimeOfDay(hour: 21, minute: 22),
    TimeOfDay(hour: 21, minute: 27),
    TimeOfDay(hour: 21, minute: 33),
    TimeOfDay(hour: 21, minute: 38),
    TimeOfDay(hour: 21, minute: 44),
    TimeOfDay(hour: 21, minute: 49),
    TimeOfDay(hour: 21, minute: 55),
    TimeOfDay(hour: 22, minute: 1),
    TimeOfDay(hour: 22, minute: 6),
    TimeOfDay(hour: 22, minute: 11),
    TimeOfDay(hour: 22, minute: 16),
    TimeOfDay(hour: 22, minute: 21),
    TimeOfDay(hour: 22, minute: 26),
    TimeOfDay(hour: 22, minute: 31),
    TimeOfDay(hour: 22, minute: 36),
    TimeOfDay(hour: 22, minute: 42),
    TimeOfDay(hour: 22, minute: 47),
    TimeOfDay(hour: 22, minute: 53),
    TimeOfDay(hour: 22, minute: 58),
    TimeOfDay(hour: 23, minute: 4),
    TimeOfDay(hour: 23, minute: 9),
    TimeOfDay(hour: 23, minute: 15),
    TimeOfDay(hour: 23, minute: 21),
    TimeOfDay(hour: 23, minute: 27),
    TimeOfDay(hour: 23, minute: 33),
    TimeOfDay(hour: 23, minute: 38),
    TimeOfDay(hour: 23, minute: 45),
    TimeOfDay(hour: 23, minute: 55),
    TimeOfDay(hour: 0, minute: 6),
  ];

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// 現在時刻に最も近いターゲット時刻を見つける関数
  int? findClosestTargetIndex(List<TimeOfDay> targetTimes, DateTime now) {
    if (targetTimes.isEmpty) return null;

    int? closestTargetIndex;
    int minDiff = double.maxFinite.toInt(); // 初期値は非常に大きな値

    for (int i = 0; i < targetTimes.length; i++) {
      // ターゲット時刻をDateTimeに変換
      DateTime targetDateTime = DateTime(
        now.year, now.month, now.day, targetTimes[i].hour, targetTimes[i].minute,
      );

      // ターゲット時刻が現在時刻より前なら無視
      if (targetDateTime.isBefore(now)) continue;

      // 差分を計算
      int diff = targetDateTime.difference(now).inSeconds;

      // 最小値を更新
      if (diff < minDiff) {
        minDiff = diff;
        closestTargetIndex = i;
      }
    }
    return closestTargetIndex;
  }

  void _updateTime() {
    _timer?.cancel(); // 古いタイマーをキャンセル
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          // 現在時刻を取得
          _currentTime = '${DateTime.now().hour}時${DateTime.now().minute}分';
          String timeDiff = '';
          DateTime now = DateTime.now();
          if (targetTimes.isEmpty) {
            timeDiff = 'ターゲット時刻が設定されていません';
            return;
          }

          // 最も近いターゲット時刻を取得
          _closestTargetIndex = findClosestTargetIndex(targetTimes, now);
          if (_closestTargetIndex != null) {
            // ターゲット時刻と現在時刻の差を計算
            _selectedTimes = [];
            _timeDiffs = []; // Clear _timeDiffs
            for(int i = 1;i<4;i++){
              if (_closestTargetIndex! + i < targetTimes.length) { // Check if index is within bounds
                DateTime targetDateTime = DateTime(
                  now.year, now.month, now.day, targetTimes[_closestTargetIndex!+i].hour, targetTimes[_closestTargetIndex!+i].minute,
                );
                Duration diff = targetDateTime.difference(now);
                int hours = diff.inHours;
                int minutes = diff.inMinutes % 60;
                int seconds = diff.inSeconds % 60;

                // 差分を表示形式に変換
                if(hours == 0){
                  timeDiff = '$minutes分$seconds秒';
                }else{
                  timeDiff = '$hours時間$minutes分$seconds秒';
                }
                _timeDiffs.add(timeDiff);
                _selectedTimes.add('${targetTimes[_closestTargetIndex!+i].hour}時${targetTimes[_closestTargetIndex!+i].minute}分');
              }
            }
          } else {
            _selectedTimes = []; // Clear _selectedTimes
            _timeDiffs = []; // Clear _timeDiffs
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100),
            Text('現在の時刻', style: TextStyle(fontSize: 50)),
            Text('$_currentTime', style: GoogleFonts.notoSerif(fontSize: 50)),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < _selectedTimes.length; i++)
                      Column(
                        children: [
                          Text('${_selectedTimes[i]}発まで', style: TextStyle(fontSize: 50)),
                          Text('${_timeDiffs[i]}', style: GoogleFonts.notoSerif(fontSize: 70,fontWeight: FontWeight.w500, color: Colors.red)),
                          SizedBox(height: 40),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}