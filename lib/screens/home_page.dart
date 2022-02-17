import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/database/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          appBar(),
          recommendationsList(),
          TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            padding: EdgeInsets.symmetric(horizontal: width(7)),
            labelPadding: EdgeInsets.symmetric(horizontal: width(15)),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            labelColor: AppColors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width(24),
            ),
            unselectedLabelColor: const Color(0xFF938DB5),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width(16),
            ),
            tabs: const <Tab>[
              Tab(text: "Hottest"),
              Tab(text: "Popular"),
              Tab(text: "New combo"),
              Tab(text: "Top"),
            ],
            onTap: (value) {},
          ),
          SizedBox(height: height(24)),
          allProductsList(),
        ],
      ),
    );
  }

  Padding appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/menu_icon.svg",
                width: width(22),
                height: height(11),
                fit: BoxFit.cover,
              ),
              InkWell(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/basket_icon.svg",
                      width: width(24),
                      height: height(24),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "My basket",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: width(10),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/order");
                },
              ),
            ],
          ),
          SizedBox(height: height(11)),
          Text(
            "Hello $userName, What fruit salad combo do you want today?",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              fontSize: width(20),
            ),
          ),
          SizedBox(height: height(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: width(288),
                height: height(56),
                child: TextFormField(
                  cursorColor: const Color(0xFFC2BDBD),
                  style: TextStyle(
                    color: AppColors.orange,
                    fontWeight: FontWeight.w500,
                    fontSize: width(14),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: width(12)),
                    filled: true,
                    fillColor: const Color(0xFFF3F4F9),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/search_icon.svg",
                      width: width(13),
                      height: height(13),
                      fit: BoxFit.scaleDown,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text(
                      "Search for fruit salad combos",
                      style: TextStyle(
                        color: const Color(0xFF86869E),
                        fontWeight: FontWeight.w400,
                        fontSize: width(14),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(width(16)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(width(16)),
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/icons/settings_icon.svg",
                width: width(26),
                height: height(17),
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: height(40)),
          Text(
            "Recommended Combo",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: width(24),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox recommendationsList() {
    return SizedBox(
      height: height(255),
      child: ListView.separated(
        itemCount: recommendations.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width(24)),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: width(23));
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Container(
              width: width(152),
              height: height(183),
              margin: EdgeInsets.only(top: height(24), bottom: height(48)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(width(16)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color(0xFF202020).withOpacity(0.05),
                    offset: Offset(0, height(30)),
                    blurRadius: height(30),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: height(8)),
                  Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Image.asset(
                        recommendations[index]["img"],
                        width: width(80),
                        height: height(80),
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: -5,
                        right: -16,
                        child: SvgPicture.asset(
                          "assets/icons/favourite_icon.svg",
                          width: width(16),
                          height: height(14.32),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height(8)),
                  Row(
                    children: <Widget>[
                      SizedBox(width: width(16)),
                      Expanded(
                        child: Text(
                          recommendations[index]["name"],
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: width(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height(8)),
                  Row(
                    children: <Widget>[
                      SizedBox(width: width(16)),
                      Text(
                        "\$ ${recommendations[index]["price"]}",
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.w400,
                          fontSize: width(14),
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: const Color(0xFFFFF2E7),
                        radius: width(12),
                        child: Icon(
                          Icons.add,
                          size: width(12),
                        ),
                      ),
                      SizedBox(width: width(16)),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                "/product",
                arguments: recommendations[index],
              );
            },
          );
        },
      ),
    );
  }

  SizedBox allProductsList() {
    return SizedBox(
      height: height(150),
      child: ListView.separated(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width(24)),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: width(16));
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: width(140),
            decoration: BoxDecoration(
              color: containerColor[index],
              borderRadius: BorderRadius.circular(width(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: width(38)),
                    InkWell(
                      child: Image.asset(
                        products[index]["img"],
                        width: width(64),
                        height: height(64),
                        fit: BoxFit.contain,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/product",
                          arguments: products[index],
                        );
                      },
                    ),
                    SizedBox(width: width(5)),
                    SvgPicture.asset(
                      "assets/icons/favourite_icon.svg",
                      color: favourite.contains(products[index])
                          ? AppColors.black
                          : AppColors.orange,
                      width: width(16),
                      height: height(14.32),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: height(8)),
                Row(
                  children: <Widget>[
                    SizedBox(width: width(8)),
                    Expanded(
                      child: Text(
                        products[index]["name"],
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: width(16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height(4)),
                Row(
                  children: <Widget>[
                    SizedBox(width: width(8)),
                    Text(
                      "\$ ${products[index]["price"]}",
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontWeight: FontWeight.w500,
                        fontSize: width(14),
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: const Color(0xFFFFF2E7),
                      radius: width(12),
                      child: Icon(
                        Icons.add,
                        size: width(12),
                      ),
                    ),
                    SizedBox(width: width(8)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
