import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_grocers/router/hg_navigator.dart';
import 'package:happy_grocers/router/hg_route.dart';
import 'package:happy_grocers/widgets/hg_button.dart';
import 'package:happy_grocers/widgets/hg_text.dart';
import 'package:happy_grocers/utils/app_styles.dart';
import 'package:happy_grocers/utils/asset_helper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetHelper.login),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1, 
            child: Container()
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    SvgPicture.asset(AssetHelper.logo),
                    const SizedBox(height: 11),
                    HGText(
                      "Welcome".toUpperCase(),
                      style: AppStyles.montserratStyle.copyWith(
                        fontSize: 40.dp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 14),
                    HGText(
                      "to Thailand’s sustainable\nfood movement",
                      textAlign: TextAlign.center,
                      style: AppStyles.montserratStyle.copyWith(
                        fontSize: 14.dp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 28),
                    HGButton(
                      "Get Started",
                      onPressed: () {
                     HGNavigator.goNamed(context, HGRoute.loginRoute);
                      },
                    ),
                    const SizedBox(height: 14),
                    HGButton(
                      "Continue as Guest",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
