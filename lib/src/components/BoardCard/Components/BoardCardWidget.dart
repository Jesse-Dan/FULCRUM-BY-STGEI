import 'package:flutter/material.dart';
import '../../../styles/Colors.dart';
import '../../../styles/Dimentions.dart';
import '../Model/BoardCardModel.dart';

BoardCardWidget(context, {required BoardCardModel BoardCardModel}) => InkWell(
      hoverColor: AppColors.kOtherPurple,
      hoverDuration: const Duration(milliseconds: 300),
      onTap: BoardCardModel.voidCallback,
      onHover: (_) {},
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(AppDimentions.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              BoardCardModel.iconData,
              size: 50,
            ),
            const SizedBox(width: AppDimentions.medium),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(BoardCardModel.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.ksecondary600)),
                Text(BoardCardModel.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.kOtherPurple)),
              ],
            )
          ],
        ),
      ),
    );
