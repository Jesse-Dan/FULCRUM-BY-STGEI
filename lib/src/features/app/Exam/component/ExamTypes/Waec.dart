import 'package:flutter/material.dart';
import '../../../../../components/PopableHeader.dart';
import '../../../../../styles/Colors.dart';
import '../../../../../styles/Dimentions.dart';

class Waec extends StatelessWidget {
  static const String routeName = '/Waec';
  const Waec({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(AppDimentions.medium),
        child:  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopableHeader('Take an Exam - Waec Simulator', context),

                  const SizedBox(height: AppDimentions.extraLarge),])));
  }
}

