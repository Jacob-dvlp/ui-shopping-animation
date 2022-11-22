import 'package:flutter/material.dart';
import 'package:shopping/utils/app_color.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({Key? key}) : super(key: key);

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6),
        () => Navigator.pushReplacementNamed(context, '/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/adidas.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              right: 0,
              left: 0,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.backgroundColor,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
