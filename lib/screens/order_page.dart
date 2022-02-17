import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/database/database.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
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
            flex: 10,
            child: ordersList(),
          ),
          Expanded(
            flex: 2,
            child: bottomBar(context),
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

  ListView ordersList() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: width(24)),
          leading: Container(
            width: width(65),
            height: height(64),
            decoration: BoxDecoration(
              color: containerColor[index],
              borderRadius: BorderRadius.circular(width(10)),
            ),
            child: Image.asset(
              orders.elementAt(index)["img"],
              width: width(40),
              height: height(24.93),
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            orders.elementAt(index)["name"],
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: width(16),
            ),
          ),
          subtitle: Text(
            "${orders.elementAt(index)["count"]} pack",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              fontSize: width(14),
            ),
          ),
          trailing: Text(
            "\$ ${int.parse(orders.elementAt(index)["price"]) * orders.elementAt(index)["count"]}",
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: width(16),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFFF4F4F4),
          thickness: 1,
        );
      },
      itemCount: orders.length,
      padding: EdgeInsets.symmetric(vertical: height(20)),
      physics: const BouncingScrollPhysics(),
    );
  }

  Row bottomBar(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: width(24)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Total",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: width(16),
              ),
            ),
            Text(
              "\$ ${totalizer()}",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: width(24),
              ),
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.orange,
            onPrimary: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            fixedSize: Size(width(199), height(56)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width(10)),
            ),
          ),
          child: Text(
            "Checkout",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: width(16),
            ),
          ),
          onPressed: () {
            if (totalizer() > 0) {
              ordersHistory.add(
                {
                  "total": "${totalizer()}",
                  "location": "Uzbekistan, Tashkent, Chilanzar 9",
                  "payment": "",
                  "orderedTime": "",
                  "products": [orders],
                },
              );
              modalSheet(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  margin: EdgeInsets.fromLTRB(
                    width(24),
                    0,
                    width(24),
                    height(100),
                  ),
                  backgroundColor: Colors.black54,
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  content: const Text(
                    "Please add something to your basket!",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },
        ),
        SizedBox(width: width(24)),
      ],
    );
  }

  Future<dynamic> modalSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(width(24)),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              SizedBox(
                width: width(375),
                height: height(406),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(24),
                    vertical: height(40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Delivery address",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: width(20),
                        ),
                      ),
                      SizedBox(height: height(16)),
                      SizedBox(
                        width: width(327),
                        height: height(56),
                        child: TextFormField(
                          cursorColor: const Color(0xFFC2BDBD),
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w400,
                            fontSize: width(20),
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: width(24)),
                            filled: true,
                            fillColor: const Color(0xFFF3F1F1),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label: Text(
                              "10th avenue, Lekki, Lagos State",
                              style: TextStyle(
                                color: const Color(0xFFC2BDBD),
                                fontWeight: FontWeight.w400,
                                fontSize: width(20),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(width(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(width(10)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height(24)),
                      Text(
                        "Number we can call",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: width(20),
                        ),
                      ),
                      SizedBox(height: height(16)),
                      SizedBox(
                        width: width(327),
                        height: height(56),
                        child: TextFormField(
                          cursorColor: const Color(0xFFC2BDBD),
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w400,
                            fontSize: width(20),
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: width(24)),
                            filled: true,
                            fillColor: const Color(0xFFF3F1F1),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label: Text(
                              "09090605708",
                              style: TextStyle(
                                color: const Color(0xFFC2BDBD),
                                fontWeight: FontWeight.w400,
                                fontSize: width(20),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(width(10)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(width(10)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height(40)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.white,
                              onPrimary: Colors.orange,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              fixedSize: Size(width(125), height(56)),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.orange,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(width(10)),
                              ),
                            ),
                            child: Text(
                              "Pay on delivery",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w500,
                                fontSize: width(16),
                              ),
                            ),
                            onPressed: () {
                              ordersHistory[ordersHistory.length - 1]
                                  ["payment"] = "Pay on delivery";
                              Navigator.pushReplacementNamed(
                                context,
                                "/order_complete",
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.white,
                              onPrimary: Colors.orange,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              fixedSize: Size(width(115), height(56)),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.orange,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(width(10)),
                              ),
                            ),
                            child: Text(
                              "Pay with card",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w500,
                                fontSize: width(16),
                              ),
                            ),
                            onPressed: () {
                              ordersHistory[ordersHistory.length - 1]
                                  ["payment"] = "Pay with card";
                              inputCardDetails(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height(-70),
                right: width(163),
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 24,
                  child: Icon(
                    Icons.clear,
                    color: const Color(0xFF070648),
                    size: width(25),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> inputCardDetails(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(width(24)),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              SizedBox(
                width: width(375),
                height: height(516),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        width(24),
                        height(40),
                        width(24),
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Card Holders Name",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: width(20),
                            ),
                          ),
                          SizedBox(height: height(16)),
                          SizedBox(
                            width: width(327),
                            height: height(56),
                            child: TextFormField(
                              cursorColor: const Color(0xFFC2BDBD),
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w400,
                                fontSize: width(20),
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: width(24)),
                                filled: true,
                                fillColor: const Color(0xFFF3F1F1),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                label: Text(
                                  "Adolphus Chris",
                                  style: TextStyle(
                                    color: const Color(0xFFC2BDBD),
                                    fontWeight: FontWeight.w400,
                                    fontSize: width(20),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.circular(width(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.circular(width(10)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height(24)),
                          Text(
                            "Card Number",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: width(20),
                            ),
                          ),
                          SizedBox(height: height(16)),
                          SizedBox(
                            width: width(327),
                            height: height(56),
                            child: TextFormField(
                              cursorColor: const Color(0xFFC2BDBD),
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w400,
                                fontSize: width(20),
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: width(24)),
                                filled: true,
                                fillColor: const Color(0xFFF3F1F1),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                label: Text(
                                  "1234 5678 9012 1314",
                                  style: TextStyle(
                                    color: const Color(0xFFC2BDBD),
                                    fontWeight: FontWeight.w400,
                                    fontSize: width(20),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.circular(width(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.circular(width(10)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height(24)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width(20),
                                    ),
                                  ),
                                  SizedBox(height: height(16)),
                                  SizedBox(
                                    width: width(134),
                                    height: height(56),
                                    child: TextFormField(
                                      cursorColor: const Color(0xFFC2BDBD),
                                      style: TextStyle(
                                        color: AppColors.orange,
                                        fontWeight: FontWeight.w400,
                                        fontSize: width(20),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: width(24)),
                                        filled: true,
                                        fillColor: const Color(0xFFF3F1F1),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        label: Text(
                                          "10/30",
                                          style: TextStyle(
                                            color: const Color(0xFFC2BDBD),
                                            fontWeight: FontWeight.w400,
                                            fontSize: width(20),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(width(10)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(width(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "CCV",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width(20),
                                    ),
                                  ),
                                  SizedBox(height: height(16)),
                                  SizedBox(
                                    width: width(134),
                                    height: height(56),
                                    child: TextFormField(
                                      cursorColor: const Color(0xFFC2BDBD),
                                      style: TextStyle(
                                        color: AppColors.orange,
                                        fontWeight: FontWeight.w400,
                                        fontSize: width(20),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: width(24)),
                                        filled: true,
                                        fillColor: const Color(0xFFF3F1F1),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        label: Text(
                                          "123",
                                          style: TextStyle(
                                            color: const Color(0xFFC2BDBD),
                                            fontWeight: FontWeight.w400,
                                            fontSize: width(20),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(width(10)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(width(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: width(375),
                      height: height(96),
                      padding: EdgeInsets.fromLTRB(
                        width(120),
                        height(24),
                        width(120),
                        height(16),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(width(24)),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.white,
                          onPrimary: Colors.orange,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          fixedSize: Size(width(135), height(56)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width(10)),
                          ),
                        ),
                        child: Text(
                          "Complete Order",
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: width(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/order_complete",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height(-70),
                right: width(163),
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 24,
                  child: Icon(
                    Icons.clear,
                    color: const Color(0xFF070648),
                    size: width(25),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int totalizer() {
    dynamic _temp = 0;
    for (var order in orders) {
      _temp += int.parse(order["price"]) * order["count"];
    }
    return _temp;
  }
}
