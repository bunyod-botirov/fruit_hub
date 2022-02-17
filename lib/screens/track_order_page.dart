import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/database/database.dart';
import 'package:fruit_hub/providers/track_order_provider.dart';
import 'package:provider/provider.dart';

class TrackOrderPage extends StatelessWidget {
  TrackOrderPage({Key? key}) : super(key: key) {
    ordersHistory[ordersHistory.length - 1]["orderedTime"] =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} | ${DateTime.now().hour}:${DateTime.now().minute}";
  }

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
          Expanded(
            flex: 2,
            child: appBar(context),
          ),
          Expanded(
            flex: 12,
            child: steps(),
          ),
        ],
      ),
    );
  }

  Container appBar(BuildContext context) {
    return Container(
      color: AppColors.orange,
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
              width: width(80),
              height: height(32),
              margin: EdgeInsets.only(left: width(24)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(width(100)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/arrow_back_icon.svg",
                    width: width(10),
                    height: height(20),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: width(4)),
                  Text(
                    "Go back",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: width(16),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(width: width(34)),
          Text(
            "My Basket",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: width(24),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView steps() {
    return SingleChildScrollView(
      child: ChangeNotifierProvider<TrackOrderProvider>(
        create: (BuildContext context) => TrackOrderProvider(),
        builder: (BuildContext context, Widget? child) {
          return ChangeNotifierProvider(
            create: (context) => TrackOrderProvider(),
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height(40)),
                  step1(),
                  stepperDots(),
                  step2(context),
                  stepperDots(),
                  step3(context),
                  stepperDots(),
                  step4(context),
                ],
              );
            },
          );
        },
      ),
    );
  }

  ExpansionTile step1() {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(
        horizontal: width(24),
        vertical: height(10),
      ),
      childrenPadding: EdgeInsets.fromLTRB(
        width(24),
        0,
        width(24),
        height(14),
      ),
      leading: Container(
        width: width(65),
        height: height(64),
        decoration: BoxDecoration(
          color: containerColor[0],
          borderRadius: BorderRadius.circular(width(10)),
        ),
        child: Image.asset(
          "assets/images/step1.png",
          width: width(48),
          height: height(43.25),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        "Order Taken",
        style: TextStyle(
          color: const Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: width(16),
        ),
      ),
      trailing: SvgPicture.asset(
        "assets/icons/done_icon.svg",
        width: width(24),
        height: height(24),
        fit: BoxFit.contain,
      ),
      children: <Widget>[
        Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              title: text("Order time:"),
              trailing: text(
                ordersHistory[ordersHistory.length - 1]["orderedTime"],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              title: text("Payment type:"),
              trailing: text(
                ordersHistory[ordersHistory.length - 1]["payment"],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              title: text("Delivery Location:"),
              trailing: text(
                ordersHistory[ordersHistory.length - 1]["location"],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              title: text("Total to pay:"),
              trailing: text(
                "\$ ${ordersHistory[ordersHistory.length - 1]["total"]}",
              ),
            ),
          ],
        ),
      ],
    );
  }

  ExpansionTile step2(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(
        horizontal: width(24),
        vertical: height(10),
      ),
      childrenPadding: EdgeInsets.fromLTRB(
        width(24),
        0,
        width(24),
        height(14),
      ),
      leading: Container(
        width: width(65),
        height: height(64),
        decoration: BoxDecoration(
          color: containerColor[1],
          borderRadius: BorderRadius.circular(width(10)),
        ),
        child: Image.asset(
          "assets/images/step2.png",
          width: width(48),
          height: height(43.25),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        "Order Is Being Prepared",
        style: TextStyle(
          color: const Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: width(16),
        ),
      ),
      trailing: context.watch<TrackOrderProvider>().isStepFinished2
          ? SvgPicture.asset(
              "assets/icons/done_icon.svg",
              width: width(24),
              height: height(24),
              fit: BoxFit.contain,
            )
          : const SizedBox(width: 0, height: 0),
      children: <Widget>[
        SizedBox(
          width: width(375),
          height: height(57) *
              ordersHistory[ordersHistory.length - 1]["products"][0].length,
          child: ListView.builder(
            itemCount:
                ordersHistory[ordersHistory.length - 1]["products"][0].length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.only(left: width(16)),
                horizontalTitleGap: width(24),
                dense: true,
                leading: text(
                  "${ordersHistory[ordersHistory.length - 1]["products"][0].elementAt(index)["count"]} pack",
                ),
                title: text(
                  ordersHistory[ordersHistory.length - 1]["products"][0]
                      .elementAt(index)["name"],
                ),
                trailing: text(
                  "\$ ${ordersHistory[ordersHistory.length - 1]["products"][0].elementAt(index)["price"]}",
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ExpansionTile step3(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(
        horizontal: width(24),
        vertical: height(10),
      ),
      childrenPadding: EdgeInsets.fromLTRB(
        width(24),
        0,
        width(24),
        height(14),
      ),
      leading: Container(
        width: width(65),
        height: height(64),
        decoration: BoxDecoration(
          color: containerColor[2],
          borderRadius: BorderRadius.circular(width(10)),
        ),
        child: Image.asset(
          "assets/images/step3.png",
          width: width(48),
          height: height(43.25),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        "Order Is Being Delivered",
        style: TextStyle(
          color: const Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: width(16),
        ),
      ),
      trailing: context.watch<TrackOrderProvider>().isStepFinished3
          ? SvgPicture.asset(
              "assets/icons/done_icon.svg",
              width: width(24),
              height: height(24),
              fit: BoxFit.contain,
            )
          : const SizedBox(width: 0, height: 0),
      children: <Widget>[
        SizedBox(
          width: width(327),
          height: height(128),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(width(10)),
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  ListTile step4(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: width(24),
        vertical: height(10),
      ),
      leading: Container(
        width: width(65),
        height: height(64),
        padding: EdgeInsets.symmetric(
          horizontal: width(10),
          vertical: height(10),
        ),
        decoration: BoxDecoration(
          color: containerColor[3],
          borderRadius: BorderRadius.circular(width(10)),
        ),
        child: SvgPicture.asset("assets/icons/done_icon.svg"),
      ),
      title: Text(
        "Order Received",
        style: TextStyle(
          color: const Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: width(16),
        ),
      ),
      trailing: context.watch<TrackOrderProvider>().isStepFinished4
          ? SvgPicture.asset(
              "assets/icons/done_icon.svg",
              width: width(24),
              height: height(24),
              fit: BoxFit.contain,
            )
          : const SizedBox(width: 0, height: 0),
    );
  }

  Padding stepperDots() {
    return Padding(
      padding: EdgeInsets.only(left: width(56)),
      child: SizedBox(
        height: height(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Icon(
              Icons.circle,
              color: AppColors.orange,
              size: 4,
            ),
            Icon(
              Icons.circle,
              color: AppColors.orange,
              size: 4,
            ),
            Icon(
              Icons.circle,
              color: AppColors.orange,
              size: 4,
            ),
            Icon(
              Icons.circle,
              color: AppColors.orange,
              size: 4,
            ),
          ],
        ),
      ),
    );
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w400,
        fontSize: width(14),
      ),
    );
  }
}
