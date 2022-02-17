import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/constants/size_config.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(64)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: height(100),
              backgroundImage: const NetworkImage(
                "https://c.tenor.com/Hw7f-4l0zgEAAAAC/check-green.gif",
              ),
            ),
            SizedBox(height: height(56)),
            Text(
              "Congratulations!!!",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: width(32),
              ),
            ),
            SizedBox(height: height(16)),
            Text(
              "Your order have been taken and is being attended to",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: width(20),
              ),
            ),
            SizedBox(height: height(56)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.orange,
                onPrimary: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                fixedSize: Size(width(133), height(56)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width(10)),
                ),
              ),
              child: Text(
                "Track order",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: width(16),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/track_order");
              },
            ),
            SizedBox(height: height(48)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.white,
                onPrimary: Colors.orange,
                elevation: 0,
                shadowColor: Colors.transparent,
                fixedSize: Size(width(181), height(56)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width(10)),
                  side: const BorderSide(
                    color: AppColors.orange,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                "Continue shopping",
                style: TextStyle(
                  color: AppColors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: width(16),
                ),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
