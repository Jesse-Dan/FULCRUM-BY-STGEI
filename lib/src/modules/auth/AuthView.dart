import 'package:flutter/material.dart';
import 'package:untitled/src/reusable/components/app_button.dart';
import 'package:untitled/src/reusable/components/app_text_field.dart';
import 'package:untitled/src/reusable/enums/enums.dart';
import 'package:untitled/src/reusable/styles/AppFontsStyles.dart';
import 'package:untitled/src/reusable/styles/Dimentions.dart';

import '../../reusable/helpers/responsive.dart';

class AuthView extends StatefulWidget {
  static const String routeName = '/';
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final studentCodeController = TextEditingController();
  final surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileView(),
      desktop: _buildDesktopView(),
    );
  }

  Widget _buildMobileView() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 450),
          decoration: const BoxDecoration(color: Colors.black),
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimentions.extraLarge * 3.5,
              vertical: AppDimentions.extraLarge),
          child: Column(
            children: [
              Text(
                'Fulcrum Auth',
                style: AppFontsStyles.titleLarge(Colors.white)
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 30),
              ),
              const SizedBox(
                height: AppDimentions.medium,
              ),
              AppTextField(
                  labelText: 'Student Code',
                  hintText: 'Enter your assigned student code',
                  controller: studentCodeController),
              AppTextField(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name in lowercase',
                  controller: surnameController),
              const SizedBox(
                height: AppDimentions.medium,
              ),
              AppButton(
                flex: true,
                buttonType: ButtonType.LONG_BTN,
                applyInternalPadding: true,
                btnText: 'Authenticate',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopView() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 800),
          decoration: const BoxDecoration(color: Colors.black),
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimentions.extraLarge * 5,
              vertical: AppDimentions.extraLarge * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fulcrum Auth',
                style: AppFontsStyles.titleLarge(Colors.white)
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 50),
              ),
              const SizedBox(
                height: AppDimentions.medium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AppTextField(
                        labelText: 'Student Code',
                        hintText: 'Enter your assigned student code',
                        controller: studentCodeController),
                  ),
                  const SizedBox(
                    width: AppDimentions.large * 2,
                  ),
                  Flexible(
                    child: AppTextField(
                        labelText: 'Last Name',
                        hintText: 'Enter your last name in lowercase',
                        controller: surnameController),
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimentions.medium,
              ),
              AppButton(
                flex: false,
                buttonType: ButtonType.LONG_BTN,
                applyInternalPadding: true,
                btnText: 'Authenticate',
              )
            ],
          ),
        ),
      ),
    );
  }
}
