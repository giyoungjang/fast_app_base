import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';

class TtossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;

  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  bool _showRedDot = false;
  int _tappingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      color: context.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          AnimatedContainer(
            duration: 1000.ms,
            color: Colors.red,
            height: _tappingCount < 2 ? 60 : 30,
            child: Image.asset(
              '$basePath/icon/toss.png',
              height: 30,
            ),
          ),
          AnimatedCrossFade(
              firstChild: Image.asset(
                '$basePath/icon/toss.png',
                height: 30,
              ),
              secondChild: Image.asset(
                '$basePath/icon/map_point.png',
                height: 30,
              ),
              crossFadeState: _tappingCount < 2
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: 1500.ms),
          emptyExpanded,
          _tappingCount.text.color(Colors.white).make(),
          Tap(
            onTap: () {
              setState(() {
                _tappingCount--;
              });
            },
            child: Image.asset(
              '$basePath/icon/map_point.png',
              height: 30,
            ),
          ),
          width10,
          Tap(
            onTap: () {
              Nav.push(const NotificationScreen());
            },
            child: Stack(
              children: [
                Image.asset(
                  '$basePath/icon/notification.png',
                  height: 30,
                ),
                if (_showRedDot)
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  ))
              ],
            )
                .animate()
                .shake(duration: 2000.ms, hz: 3)
                .then()
                .fadeOut(duration: 1000.ms),
          ),
          width10,
        ],
      ),
    );
  }
}
