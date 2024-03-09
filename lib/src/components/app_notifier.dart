import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:untitled/src/styles/Dimentions.dart';

import '../core/logger/logger.dart';
import '../enums/enums.dart';
import '../styles/Colors.dart';

class AppNotifier {
  static notify(context,
          {required AppNotifierType appNotifierType,
          String title = '',
          String message = ''}) =>
      InAppNotification.show(
        dismissCurve: Curves.easeInOutBack,
        duration: const Duration(seconds: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimentions.medium),
          decoration: ShapeDecoration(
            color: appNotifierType == AppNotifierType.SUCCESS
                ? AppColors.ksecondary500
                : AppColors.kerror,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: appNotifierType == AppNotifierType.SUCCESS
                      ? AppColors.ksecondary500
                      : AppColors.kerror),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: appNotifierType == AppNotifierType.SUCCESS
                      ? AppColors.ksecondary500
                      : AppColors.kerror,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 202,
                child: Text(
                  message,
                  style: TextStyle(
                    color: AppColors.ksecondary300,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        context: context,
        onTap: () => Logger(tag: Tag.SERVICE_ACTION, message: 'Notified'),
      );

  static notifyAction(
    context, {
    String message = '',
  }) {
    return InAppNotification.show(
      dismissCurve: Curves.easeInOutBack,
      duration: const Duration(seconds: 2),
      child: _buildNotifier(message),
      context: context,
      onTap: () => Logger(tag: Tag.SERVICE_ACTION, message: 'User Tapped Notifier'),
    );
  }

  static Widget _buildNotifier(message) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      width: 94,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColors.kprimary600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      duration: const Duration(seconds: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.11,
            ),
          ),
        ],
      ),
    );
  }
}
