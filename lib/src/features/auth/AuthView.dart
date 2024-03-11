import 'package:flutter/material.dart';
import 'package:untitled/src/styles/AppFontsStyles.dart';

import '../../helpers/responsive.dart';
import '../../styles/Assets.dart';
import '../../styles/Colors.dart';

class AuthView extends StatefulWidget {
  static const String routeName = '/AuthView';
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.ksecondary500,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Responsive.isMobile(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColors.kOtherBlue,
                      child: Center(
                        child: Text(
                          'AdminExpress',
                          style: AppFontsStyles.labelLarge(
                            AppColors.kOtherBlue,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.ksecondary600,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.kprimary600,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Let’s',
                              style: AppFontsStyles.labelLarge(
                                AppColors.kOtherBlue,
                              ).copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.ksecondary600,
                                fontSize: 16.0,
                              ),
                            ),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: AppFontsStyles.labelLarge(
                                AppColors.kOtherBlue,
                              ).copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.ksecondary600,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: AppFontsStyles.bodySmall(AppColors.kOtherPurple)
                            .copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email',
                          style: AppFontsStyles.labelLarge(
                            AppColors.kOtherBlue,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.ksecondary600,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.ksecondary600,
                        ),
                        child: TextFormField(
                          style: AppFontsStyles.labelLarge(
                            AppColors.kOtherBlue,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.ksecondary600,
                            fontSize: 16.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppAssets.mailIcon),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter Email',
                            hintStyle: AppFontsStyles.labelLarge(
                              AppColors.kOtherBlue,
                            ).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.ksecondary600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: AppFontsStyles.labelLarge(
                            AppColors.kOtherBlue,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.ksecondary600,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.ksecondary600,
                        ),
                        child: TextFormField(
                          style: AppFontsStyles.labelLarge(
                            AppColors.kOtherBlue,
                          ).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.ksecondary600,
                            fontSize: 16.0,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppAssets.checkIcon),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AppAssets.lockIcon),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter Password',
                            hintStyle: AppFontsStyles.labelLarge(
                              AppColors.kOtherBlue,
                            ).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.ksecondary600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppFontsStyles.labelLarge(
                              AppColors.kOtherBlue,
                            ).copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.kOtherBlue,
                            ),
                            child: Text(
                              'Sign In',
                              style: AppFontsStyles.labelLarge(
                                AppColors.kOtherBlue,
                              ).copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.ksecondary600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
