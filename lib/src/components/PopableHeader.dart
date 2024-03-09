import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:text_scroll/text_scroll.dart';

import '../styles/Colors.dart';

PopableHeader(text, context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                Go(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_sharp)),
          TextScroll(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.kOtherPurple,
                fontSize: 30,
                fontWeight: FontWeight.w600),
            mode: TextScrollMode.endless,
            velocity: const Velocity(pixelsPerSecond: Offset(150, 0)),
            delayBefore: const Duration(milliseconds: 500),
            pauseBetween: const Duration(milliseconds: 50),
            textAlign: TextAlign.right,
            selectable: true,
          ),
        ],
      ),
    );
