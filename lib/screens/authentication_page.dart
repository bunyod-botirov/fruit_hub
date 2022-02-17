import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants/size_config.dart';
import 'package:fruit_hub/constants/app_colors.dart';
import 'package:fruit_hub/database/database.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  final TextEditingController _formController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: AppColors.orange,
              width: width(375),
              height: height(469),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/fruits2.png",
                    width: width(301),
                    height: height(281.21),
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
                    "What is your firstname?",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(20),
                    ),
                  ),
                  SizedBox(height: height(16)),
                  textField(),
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
                    child: const Text(
                      "Start Ordering",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        userName = _formController.text;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/home",
                          (route) => false,
                        );
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox textField() {
    return SizedBox(
      height: height(56),
      child: TextFormField(
        key: _formKey,
        controller: _formController,
        cursorColor: const Color(0xFFC2BDBD),
        style: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.w400,
          fontSize: width(20),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: width(12)),
          filled: true,
          fillColor: const Color(0xFFF3F1F1),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            "Tony",
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
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(width(10)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(width(10)),
          ),
          errorStyle: const TextStyle(
            height: 0.1,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please write your name";
          }
        },
      ),
    );
  }
}
