import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/components/app_button.dart';
import 'package:untitled/src/enums/enums.dart';
import 'package:untitled/src/styles/Colors.dart';

class PickerHelper {
  static Future<List<T>?> pick<T>(
    BuildContext context, {
    required List<T> items,
    required List<T> initialSelectedItems,
    required Widget Function(T) itemBuilder,
  }) async {
    List<T> selectedItems = List.from(initialSelectedItems);

    return await showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, useState) {
          return Container(
            color: AppColors.kOtherPurple,
            height: 300,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];
                        return Container();
                      },
                    ),
                  ),
                  Row(
                    children: [
                      AppButton(
                        btnText: 'Cancel',
                        buttonType: ButtonType.SHORT_BTN,
                        addBorder: true,
                        applyInternalPadding: false,
                        btnColor: AppColors.ksecondary600,
                        borderColor: AppColors.kOtherPurple,
                      ),
                      AppButton(
                        btnText: 'Proceed',
                        buttonType: ButtonType.SHORT_BTN,
                        addBorder: false,
                        applyInternalPadding: false,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

class CheckboxListExample extends StatefulWidget {
  const CheckboxListExample({Key? key}) : super(key: key);

  @override
  State<CheckboxListExample> createState() => _CheckboxListExampleState();
}

class _CheckboxListExampleState extends State<CheckboxListExample> {
  List<String> _selectedFruits = ['Apple', 'Banana'];

  final List<String> _fruitNames = <String>[
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Checkbox List Sample'),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                onPressed: () async {
                  List<String>? result = await PickerHelper.pick<String>(
                    context,
                    items: _fruitNames,
                    initialSelectedItems: _selectedFruits,
                    itemBuilder: (String item) => Text(item),
                  );
                  if ((result ?? []).isNotEmpty) {
                    setState(() {
                      _selectedFruits = result!;
                    });
                  }
                },
                child: Text(
                  'Selected fruits: ${_selectedFruits.join(', ')}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
