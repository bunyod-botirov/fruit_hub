import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/constants/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.orange,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: AppColors.orange,
            width: width(375),
            height: height(469),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/fruits1.png",
                  width: width(301),
                  height: height(260),
                ),
                SizedBox(height: height(8)),
                SvgPicture.asset(
                  "assets/images/fruits_shadow.svg",
                  width: width(301),
                  height: height(12),
                ),
              ],
            ),
          ),
          Container(
            height: height(314),
            padding: EdgeInsets.symmetric(horizontal: width(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),
                Text(
                  "Get The Freshest Fruit Salad Combo",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: width(20),
                  ),
                ),
                SizedBox(height: height(8)),
                Text(
                  "We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
                  style: TextStyle(
                    color: const Color(0xFF5D577E),
                    fontWeight: FontWeight.w400,
                    fontSize: width(16),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.orange,
                    onPrimary: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    fixedSize: Size(width(327), height(56)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width(10)),
                    ),
                  ),
                  child: Text(
                    "Let's Continue",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: width(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/authentication",
                      (route) => false,
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
