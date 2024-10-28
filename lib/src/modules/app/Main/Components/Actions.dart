import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:untitled/src/reusable/components/dropdown_button.dart';
import 'package:untitled/src/services/logger/logger.dart';

import '../../../../reusable/enums/enums.dart';
import '../../Search/SearchView.dart';

AppBarActions(context) {
  final TextEditingController textEditingController = TextEditingController();
  return [
    IconButton(
      onPressed: () {
        Go(context).to(routeName: SearchView.routeName);
      },
      icon: const Icon(Icons.search_rounded),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.payment_sharp),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.chat_sharp),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.question_answer_sharp),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.support_agent_sharp),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.light_mode_sharp),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.more_horiz_sharp),
    ),
    SizedBox(
        height: 50,
        width: 50,
        child: appDropdownButton(
            icon: Icons.light_mode_sharp,
            controller: textEditingController,
            items: ['Light', 'Dark', 'System'],
            value: null,
            onChanged: (_) {
              Logger.log(
                  tag: Tag.CALLBACK, message: _ ?? 'Error ON Theme Change');
            }))
  ];
}
