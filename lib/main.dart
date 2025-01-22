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
    const TimeOfDay(hour: 5, minute: 9),
    const TimeOfDay(hour: 5, minute: 27),
    const TimeOfDay(hour: 5, minute: 37),
    const TimeOfDay(hour: 5, minute: 46),
    const TimeOfDay(hour: 5, minute: 58),
    const TimeOfDay(hour: 6, minute: 10),
    const TimeOfDay(hour: 6, minute: 17),
    const TimeOfDay(hour: 6, minute: 25),
    const TimeOfDay(hour: 6, minute: 32),
    const TimeOfDay(hour: 6, minute: 36),
    const TimeOfDay(hour: 6, minute: 41),
    const TimeOfDay(hour: 6, minute: 45),
    const TimeOfDay(hour: 6, minute: 50),
    const TimeOfDay(hour: 6, minute: 56),
    const TimeOfDay(hour: 7, minute: 0),
    const TimeOfDay(hour: 7, minute: 3),
    const TimeOfDay(hour: 7, minute: 7),
    const TimeOfDay(hour: 7, minute: 12),
    const TimeOfDay(hour: 7, minute: 17),
    const TimeOfDay(hour: 7, minute: 22),
    const TimeOfDay(hour: 7, minute: 28),
    const TimeOfDay(hour: 7, minute: 33),
    const TimeOfDay(hour: 7, minute: 37),
    const TimeOfDay(hour: 7, minute: 42),
    const TimeOfDay(hour: 7, minute: 48),
    const TimeOfDay(hour: 7, minute: 52),
    const TimeOfDay(hour: 7, minute: 57),
    const TimeOfDay(hour: 8, minute: 1),
    const TimeOfDay(hour: 8, minute: 4),
    const TimeOfDay(hour: 8, minute: 8),
    const TimeOfDay(hour: 8, minute: 11),
    const TimeOfDay(hour: 8, minute: 14),
    const TimeOfDay(hour: 8, minute: 17),
    const TimeOfDay(hour: 8, minute: 19),
    const TimeOfDay(hour: 8, minute: 22),
    const TimeOfDay(hour: 8, minute: 25),
    const TimeOfDay(hour: 8, minute: 28),
    const TimeOfDay(hour: 8, minute: 31),
    const TimeOfDay(hour: 8, minute: 34),
    const TimeOfDay(hour: 8, minute: 37),
    const TimeOfDay(hour: 8, minute: 39),
    const TimeOfDay(hour: 8, minute: 42),
    const TimeOfDay(hour: 8, minute: 47),
    const TimeOfDay(hour: 8, minute: 49),
    const TimeOfDay(hour: 8, minute: 52),
    const TimeOfDay(hour: 8, minute: 54),
    const TimeOfDay(hour: 8, minute: 57),
    const TimeOfDay(hour: 8, minute: 59),
    const TimeOfDay(hour: 9, minute: 2),
    const TimeOfDay(hour: 9, minute: 5),
    const TimeOfDay(hour: 9, minute: 8),
    const TimeOfDay(hour: 9, minute: 11),
    const TimeOfDay(hour: 9, minute: 14),
    const TimeOfDay(hour: 9, minute: 17),
    const TimeOfDay(hour: 9, minute: 20),
    const TimeOfDay(hour: 9, minute: 23),
    const TimeOfDay(hour: 9, minute: 26),
    const TimeOfDay(hour: 9, minute: 29),
    const TimeOfDay(hour: 9, minute: 32),
    const TimeOfDay(hour: 9, minute: 35),
    const TimeOfDay(hour: 9, minute: 38),
    const TimeOfDay(hour: 9, minute: 41),
    const TimeOfDay(hour: 9, minute: 44),
    const TimeOfDay(hour: 9, minute: 49),
    const TimeOfDay(hour: 9, minute: 53),
    const TimeOfDay(hour: 9, minute: 59),
    const TimeOfDay(hour: 10, minute: 4),
    const TimeOfDay(hour: 10, minute: 10),
    const TimeOfDay(hour: 10, minute: 16),
    const TimeOfDay(hour: 10, minute: 22),
    const TimeOfDay(hour: 10, minute: 27),
    const TimeOfDay(hour: 10, minute: 32),
    const TimeOfDay(hour: 10, minute: 38),
    const TimeOfDay(hour: 10, minute: 43),
    const TimeOfDay(hour: 10, minute: 49),
    const TimeOfDay(hour: 10, minute: 54),
    const TimeOfDay(hour: 10, minute: 59),
    const TimeOfDay(hour: 11, minute: 4),
    const TimeOfDay(hour: 11, minute: 10),
    const TimeOfDay(hour: 11, minute: 16),
    const TimeOfDay(hour: 11, minute: 22),
    const TimeOfDay(hour: 11, minute: 28),
    const TimeOfDay(hour: 11, minute: 34),
    const TimeOfDay(hour: 11, minute: 40),
    const TimeOfDay(hour: 11, minute: 46),
    const TimeOfDay(hour: 11, minute: 52),
    const TimeOfDay(hour: 12, minute: 4),
    const TimeOfDay(hour: 12, minute: 10),
    const TimeOfDay(hour: 12, minute: 16),
    const TimeOfDay(hour: 12, minute: 22),
    const TimeOfDay(hour: 12, minute: 28),
    const TimeOfDay(hour: 12, minute: 34),
    const TimeOfDay(hour: 12, minute: 40),
    const TimeOfDay(hour: 12, minute: 46),
    const TimeOfDay(hour: 12, minute: 52),
    const TimeOfDay(hour: 12, minute: 58),
    const TimeOfDay(hour: 13, minute: 4),
    const TimeOfDay(hour: 13, minute: 10),
    const TimeOfDay(hour: 13, minute: 16),
    const TimeOfDay(hour: 13, minute: 22),
    const TimeOfDay(hour: 13, minute: 28),
    const TimeOfDay(hour: 13, minute: 34),
    const TimeOfDay(hour: 13, minute: 40),
    const TimeOfDay(hour: 13, minute: 46),
    const TimeOfDay(hour: 13, minute: 52),
    const TimeOfDay(hour: 13, minute: 58),
    const TimeOfDay(hour: 14, minute: 4),
    const TimeOfDay(hour: 14, minute: 10),
    const TimeOfDay(hour: 14, minute: 16),
    const TimeOfDay(hour: 14, minute: 22),
    const TimeOfDay(hour: 14, minute: 28),
    const TimeOfDay(hour: 14, minute: 34),
    const TimeOfDay(hour: 14, minute: 40),
    const TimeOfDay(hour: 14, minute: 46),
    const TimeOfDay(hour: 14, minute: 52),
    const TimeOfDay(hour: 14, minute: 58),
    const TimeOfDay(hour: 15, minute: 4),
    const TimeOfDay(hour: 15, minute: 10),
    const TimeOfDay(hour: 15, minute: 16),
    const TimeOfDay(hour: 15, minute: 22),
    const TimeOfDay(hour: 15, minute: 28),
    const TimeOfDay(hour: 15, minute: 34),
    const TimeOfDay(hour: 15, minute: 40),
    const TimeOfDay(hour: 15, minute: 46),
    const TimeOfDay(hour: 15, minute: 52),
    const TimeOfDay(hour: 15, minute: 58),
    const TimeOfDay(hour: 16, minute: 4),
    const TimeOfDay(hour: 16, minute: 10),
    const TimeOfDay(hour: 16, minute: 16),
    const TimeOfDay(hour: 16, minute: 22),
    const TimeOfDay(hour: 16, minute: 28),
    const TimeOfDay(hour: 16, minute: 34),
    const TimeOfDay(hour: 16, minute: 40),
    const TimeOfDay(hour: 16, minute: 46),
    const TimeOfDay(hour: 16, minute: 52),
    const TimeOfDay(hour: 16, minute: 58),
    const TimeOfDay(hour: 17, minute: 0),
    const TimeOfDay(hour: 17, minute: 5),
    const TimeOfDay(hour: 17, minute: 10),
    const TimeOfDay(hour: 17, minute: 15),
    const TimeOfDay(hour: 17, minute: 20),
    const TimeOfDay(hour: 17, minute: 30),
    const TimeOfDay(hour: 17, minute: 35),
    const TimeOfDay(hour: 17, minute: 40),
    const TimeOfDay(hour: 17, minute: 45),
    const TimeOfDay(hour: 17, minute: 49),
    const TimeOfDay(hour: 17, minute: 53),
    const TimeOfDay(hour: 17, minute: 56),
    const TimeOfDay(hour: 18, minute: 1),
    const TimeOfDay(hour: 18, minute: 5),
    const TimeOfDay(hour: 18, minute: 9),
    const TimeOfDay(hour: 18, minute: 13),
    const TimeOfDay(hour: 18, minute: 17),
    const TimeOfDay(hour: 18, minute: 21),
    const TimeOfDay(hour: 18, minute: 25),
    const TimeOfDay(hour: 18, minute: 29),
    const TimeOfDay(hour: 18, minute: 33),
    const TimeOfDay(hour: 18, minute: 37),
    const TimeOfDay(hour: 18, minute: 41),
    const TimeOfDay(hour: 18, minute: 45),
    const TimeOfDay(hour: 18, minute: 49),
    const TimeOfDay(hour: 18, minute: 52),
    const TimeOfDay(hour: 18, minute: 56),
    const TimeOfDay(hour: 19, minute: 1),
    const TimeOfDay(hour: 19, minute: 6),
    const TimeOfDay(hour: 19, minute: 10),
    const TimeOfDay(hour: 19, minute: 14),
    const TimeOfDay(hour: 19, minute: 18),
    const TimeOfDay(hour: 19, minute: 22),
    const TimeOfDay(hour: 19, minute: 26),
    const TimeOfDay(hour: 19, minute: 30),
    const TimeOfDay(hour: 19, minute: 34),
    const TimeOfDay(hour: 19, minute: 38),
    const TimeOfDay(hour: 19, minute: 42),
    const TimeOfDay(hour: 19, minute: 46),
    const TimeOfDay(hour: 19, minute: 51),
    const TimeOfDay(hour: 19, minute: 55),
    const TimeOfDay(hour: 20, minute: 1),
    const TimeOfDay(hour: 20, minute: 5),
    const TimeOfDay(hour: 20, minute: 10),
    const TimeOfDay(hour: 20, minute: 15),
    const TimeOfDay(hour: 20, minute: 20),
    const TimeOfDay(hour: 20, minute: 25),
    const TimeOfDay(hour: 20, minute: 30),
    const TimeOfDay(hour: 20, minute: 35),
    const TimeOfDay(hour: 20, minute: 40),
    const TimeOfDay(hour: 20, minute: 45),
    const TimeOfDay(hour: 20, minute: 50),
    const TimeOfDay(hour: 20, minute: 55),
    const TimeOfDay(hour: 21, minute: 1),
    const TimeOfDay(hour: 21, minute: 7),
    const TimeOfDay(hour: 21, minute: 12),
    const TimeOfDay(hour: 21, minute: 17),
    const TimeOfDay(hour: 21, minute: 22),
    const TimeOfDay(hour: 21, minute: 27),
    const TimeOfDay(hour: 21, minute: 33),
    const TimeOfDay(hour: 21, minute: 38),
    const TimeOfDay(hour: 21, minute: 44),
    const TimeOfDay(hour: 21, minute: 49),
    const TimeOfDay(hour: 21, minute: 55),
    const TimeOfDay(hour: 22, minute: 1),
    const TimeOfDay(hour: 22, minute: 6),
    const TimeOfDay(hour: 22, minute: 11),
    const TimeOfDay(hour: 22, minute: 16),
    const TimeOfDay(hour: 22, minute: 21),
    const TimeOfDay(hour: 22, minute: 26),
    const TimeOfDay(hour: 22, minute: 31),
    const TimeOfDay(hour: 22, minute: 36),
    const TimeOfDay(hour: 22, minute: 42),
    const TimeOfDay(hour: 22, minute: 47),
    const TimeOfDay(hour: 22, minute: 53),
    const TimeOfDay(hour: 22, minute: 58),
    const TimeOfDay(hour: 23, minute: 4),
    const TimeOfDay(hour: 23, minute: 9),
    const TimeOfDay(hour: 23, minute: 15),
    const TimeOfDay(hour: 23, minute: 21),
    const TimeOfDay(hour: 23, minute: 27),
    const TimeOfDay(hour: 23, minute: 33),
    const TimeOfDay(hour: 23, minute: 38),
    const TimeOfDay(hour: 23, minute: 45),
    const TimeOfDay(hour: 23, minute: 55),
    const TimeOfDay(hour: 0, minute: 6),
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
        now.year,
        now.month,
        now.day,
        targetTimes[i].hour,
        targetTimes[i].minute,
      );

      // ターゲット時刻が現在時刻より前なら無視
      if (targetDateTime.isBefore(now)) continue;

      // 差分を計算
      int diff = targetDateTime.difference(now).inSeconds;

      // 最小値を更新
      if (diff > 720) {
        if (diff < minDiff) {
          minDiff = diff;
          closestTargetIndex = i;
        }
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
          _currentTime = '${DateTime.now().hour}：${DateTime.now().minute}';
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
            for (int i = -1; i < 3; i++) {
              if (_closestTargetIndex! + i < targetTimes.length) {
                // Check if index is within bounds
                DateTime targetDateTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  targetTimes[_closestTargetIndex! + i].hour,
                  targetTimes[_closestTargetIndex! + i].minute,
                );
                Duration diff = targetDateTime.difference(now);
                int hours = diff.inHours;
                int minutes = diff.inMinutes % 60;
                int seconds = diff.inSeconds % 60;

                // 差分を表示形式に変換
                if (hours == 0) {
                  timeDiff = '$minutes分$seconds秒';
                } else {
                  timeDiff = '$hours時間$minutes分$seconds秒';
                }
                _timeDiffs.add(timeDiff);
                _selectedTimes.add(
                    '${targetTimes[_closestTargetIndex! + i].hour}時${targetTimes[_closestTargetIndex! + i].minute}分');
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('豊洲駅発　有楽町線', style: TextStyle(fontSize: 30)),
        ),
        body: Column(
          children: [
            //const Text('現在の時刻', style: TextStyle(fontSize: 50)),
            Align(
                alignment: Alignment(-1.0, 1.0),
                child: Container(
                  color: const Color.fromARGB(0, 84, 24, 248),
                  child: Text(
                    _currentTime,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.notoSerif(fontSize: 50),
                  ),
                )),
            //Expanded(
            const SizedBox(height: 40),
            Column(children: [
              Text('${_selectedTimes[1]}発まで',
                  style: const TextStyle(fontSize: 70)),
              Text(_timeDiffs[1],
                  style: GoogleFonts.notoSerif(
                      fontSize: 140,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 0, 255, 55))),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(children: [
                Text('${_selectedTimes[0]}発まで',
                    style: const TextStyle(fontSize: 50)),
                Text(_timeDiffs[0],
                    style: GoogleFonts.notoSerif(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 255, 17, 0))),
              ]),
              Column(children: [
                Text('${_selectedTimes[2]}発まで',
                    style: const TextStyle(fontSize: 40)),
                Text(_timeDiffs[2],
                    style: GoogleFonts.notoSerif(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 48, 38, 241))),
              ]),
            ]),
            // Align(
            //   alignment: Alignment(0.0, -1.0),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       for (int i = 0; i < _selectedTimes.length; i++)
            //         Column(
            //           //crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text('${_selectedTimes[i]}発まで',
            //                 style: const TextStyle(fontSize: 50)),
            //             Text(_timeDiffs[i],
            //                 style: GoogleFonts.notoSerif(
            //                     fontSize: 70,
            //                     fontWeight: FontWeight.w500,
            //                     color: const Color.fromARGB(255, 255, 17, 0))),
            //             const SizedBox(height: 40),
            //           ],
            //         ),
            //     ],
            //   ),
            // ),
            //),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
