import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required Map<String, dynamic> this.product})
      : super(key: key);

  final Map product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
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
            flex: 4,
            child: SizedBox(
              width: width(375),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: height(10)),
                  Center(
                    child: Image.asset(
                      product["img"],
                      width: width(176),
                      height: height(176),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(width(20)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height(40)),
                  Padding(
                    padding: EdgeInsets.only(left: width(24)),
                    child: Text(
                      product["name"],
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: width(32),
                      ),
                    ),
                  ),
                  SizedBox(height: height(30)),
                  ChangeNotifierProvider<ProductProvider>(
                    create: (BuildContext context) => ProductProvider(),
                    builder: (BuildContext context, child) {
                      return Row(
                        children: <Widget>[
                          SizedBox(width: width(24)),
                          InkWell(
                            child: Container(
                              width: width(32),
                              height: height(32),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF333333),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: const Color(0xFF333333),
                                size: width(16),
                              ),
                            ),
                            onTap: () => context
                                .read<ProductProvider>()
                                .removeCount(product),
                          ),
                          SizedBox(width: width(24)),
                          Text(
                            context.watch<ProductProvider>().count.toString(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: width(24),
                            ),
                          ),
                          SizedBox(width: width(24)),
                          InkWell(
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFFFF2E7),
                              radius: width(16),
                              child: Icon(
                                Icons.add,
                                size: width(16),
                              ),
                            ),
                            onTap: () => context
                                .read<ProductProvider>()
                                .addCount(product),
                          ),
                          const Spacer(),
                          Text(
                            "\$ ${int.parse(product["price"]) * context.watch<ProductProvider>().count}",
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: width(24),
                            ),
                          ),
                          SizedBox(width: width(24)),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: height(30)),
                  const Divider(
                    color: Color(0xFFF3F3F3),
                    thickness: 1,
                    height: 0,
                  ),
                  SizedBox(height: height(30)),
                  Container(
                    margin: EdgeInsets.only(left: width(24)),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      "One Pack Contains:",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: width(20),
                      ),
                    ),
                  ),
                  SizedBox(height: height(20)),
                  Padding(
                    padding: EdgeInsets.only(left: width(24)),
                    child: Text(
                      "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: width(16),
                      ),
                    ),
                  ),
                  SizedBox(height: height(20)),
                  const Divider(
                    color: Color(0xFFF3F3F3),
                    thickness: 1,
                    height: 0,
                  ),
                  SizedBox(height: height(24)),
                  Padding(
                    padding: EdgeInsets.only(left: width(24)),
                    child: Text(
                      product["description"],
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontSize: width(14),
                      ),
                    ),
                  ),
                  SizedBox(height: height(39)),
                  ChangeNotifierProvider<ProductProvider>(
                    create: (BuildContext context) => ProductProvider(),
                    builder: (BuildContext context, Widget? child) {
                      return Row(
                        children: <Widget>[
                          SizedBox(width: width(24)),
                          CircleAvatar(
                            backgroundColor: const Color(0xFFFFF7F0),
                            radius: width(24),
                            child: SvgPicture.asset(
                              "assets/icons/favourite_icon.svg",
                              width: width(24),
                              height: height(21.47),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.orange,
                              onPrimary: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              fixedSize: Size(width(219), height(56)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width(10)),
                              ),
                            ),
                            child: const Text(
                              "Add to basket",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              context
                                  .read<ProductProvider>()
                                  .addToBasket(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black54,
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  content: const Text(
                                    "Successfully added",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: width(24)),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
