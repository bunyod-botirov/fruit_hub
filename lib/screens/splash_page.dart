import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        "/welcome",
        (Route route) => false,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          width: width(184),
          height: height(205.05),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
