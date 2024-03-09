import 'package:flutter/material.dart';
import '../../styles/Colors.dart';
import '../../styles/Dimentions.dart';

class ErrorView extends StatelessWidget {
  static const String routeName = '/ErrorView';
  final String? errorMsg;
  const ErrorView({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          errorMsg ??
              'An error Occurred Please try again and if this issue persist contact support'
                  .toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.kprimary600, fontSize: 50)),
    );
  }
}
