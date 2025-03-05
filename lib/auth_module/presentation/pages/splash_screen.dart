import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_grocers/datamodels/user.dart';
import 'package:happy_grocers/router/hg_navigator.dart';
import 'package:happy_grocers/router/hg_route.dart';
import 'package:happy_grocers/utils/app_colors.dart';
import 'package:happy_grocers/utils/asset_helper.dart';
import 'package:happy_grocers/utils/local_storage/storage_manager.dart';

class ScreenScreen extends StatefulWidget {
  const ScreenScreen({super.key});

  @override
  State<ScreenScreen> createState() => _ScreenScreenState();
}

class _ScreenScreenState extends State<ScreenScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      isUserLogin();
    });
  }

  isUserLogin() {
    User? userData = StorageManager.getInstance().getLoginUser();
    HGNavigator.goNamed(context, userData != null ? HGRoute.homeRoute : HGRoute.welcomeRoute,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splashBg,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  AssetHelper.splash1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  AssetHelper.splash2,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Center(
            child: SvgPicture.asset(AssetHelper.splashLogo),
          ),
        ],
      ),
    );
  }
}
