import 'package:flutter/material.dart';
import 'package:untitled/src/components/PopableHeader.dart';

import '../../../../../styles/Colors.dart';
import '../../../../../styles/Dimentions.dart';

class Custom extends StatelessWidget {
  static const String routeName = '/Custom';
  const Custom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(AppDimentions.medium),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopableHeader('Take an Exam - Custom Simulator', context),
                  const SizedBox(height: AppDimentions.extraLarge),
                ])));
  }
}
