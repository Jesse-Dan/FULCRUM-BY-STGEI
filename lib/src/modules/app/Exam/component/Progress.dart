import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/styles/Dimentions.dart';
import '../../../../reusable/styles/Colors.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    Key? key,
    this.animationDuration = 60, // Default animation duration in seconds
    this.iconPath = "assets/icons/clock.svg", // Default icon path
  }) : super(key: key);

  final int animationDuration;
  final String iconPath;

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _animationValue = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _animationValue += 1 / widget.animationDuration;
        if (_animationValue >= 1) {
          _animationValue = 1.0;
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final seconds = (_animationValue * widget.animationDuration).round();
    final hours = (seconds / 3600).floor();
    final minutes = ((seconds % 3600) / 60).floor();
    final remainingSeconds = seconds % 60;

    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kprimary600, width: 1.2),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
            width: MediaQuery.of(context).size.width * _animationValue,
            decoration: BoxDecoration(
              gradient: AppColors.kGradient,
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimentions.medium / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hours >= 0
                        ? '$minutes min $remainingSeconds sec'
                        : minutes >= 0
                            ? '$remainingSeconds sec'
                            : "$hours hr $minutes min $remainingSeconds sec",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.kprimary400),
                  ),
                  // SvgPicture.asset(widget.iconPath),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
