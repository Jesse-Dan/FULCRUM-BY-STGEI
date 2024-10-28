import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/components/app_dialogue.dart';

class BoardCardModel {
  final String title;
  final String description;
  final VoidCallback voidCallback;
  final IconData iconData;

  BoardCardModel({
    required this.title,
    required this.description,
    required this.voidCallback,
    required this.iconData,
  });
}