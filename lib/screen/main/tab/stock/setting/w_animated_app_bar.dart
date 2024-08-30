import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController controller;

  const AnimatedAppBar(this.title, {super.key, required this.controller});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration get duration => 10.ms;
  double scrollPosition = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        scrollPosition = widget.controller.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;

  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
                onTap: () {
                  Nav.pop(context);
                },
                child: const Arrow(
                  direction: AxisDirection.left,
                )).p20(),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(
                  left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: 30),
                  duration: duration,
                  child: widget.title.text.make()),
            ),
            Tap(
                onTap: () {
                  Nav.pop(context);
                },
                child: const Arrow(
                  direction: AxisDirection.left,
                )).p20(),
            Positioned.fill(
                child: Align(
              alignment: Alignment.topRight,
              child: TweenAnimationBuilder<Color?>(
                duration: 1000.ms,
                tween: ColorTween(
                    begin: Colors.blue,
                    end: isTriggered ? Colors.red : Colors.blue),
                builder: (context, value, child) => ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        value ?? Colors.green, BlendMode.modulate),
                    child: child),
                child: Image.asset(
                  "$basePath/icon/map_point.png",
                  height: 60,
                  color: Colors.green,
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
