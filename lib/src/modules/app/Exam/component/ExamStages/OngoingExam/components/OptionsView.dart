import 'package:flutter/material.dart';

class OptionViewParams {
  final String text;
  final int index;
  final Color color;
  final IconData icon;
  final VoidCallback? press;

  OptionViewParams({
    required this.text,
    required this.index,
    required this.color,
    required this.icon,
    required this.press,
  });

  OptionViewParams copyWith({
    String? text,
    int? index,
    Color? color,
    IconData? icon,
    VoidCallback? press,

  }) {
    return OptionViewParams(
        text: text ?? this.text,
        index: index ?? this.index,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        press: press ?? this.press);
  }
}

class OptionView extends StatelessWidget {
  const OptionView({
    Key? key,
    required this.optionViewParams,
  }) : super(key: key);

  final OptionViewParams optionViewParams;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: optionViewParams.press,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: optionViewParams.color),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${optionViewParams.index + 1}.   ${optionViewParams.text}",
              style: const TextStyle(color: Colors.black45, fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: optionViewParams.color == Colors.transparent
                    ? Colors.transparent
                    : optionViewParams.color,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: optionViewParams.color),
              ),
              child: optionViewParams.color == Colors.transparent
                  ? null
                  : Icon(optionViewParams.icon, size: 16),
            )
          ],
        ),
      ),
    );
  }
}
