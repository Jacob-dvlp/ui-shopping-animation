import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/presetation/home/controller_home.dart';
import 'package:shopping/presetation/home/widget/body_list_widget.dart';
import 'package:shopping/presetation/home/widget/circular_widget.dart';
import 'package:shopping/presetation/home/widget/price_widget.dart';
import 'package:shopping/presetation/home/widget/title_widget.dart';
import 'package:shopping/utils/app_color.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final controller = ControllerHome();
  final pageController = PageController();
  double page = 0;
  void _onListener() {
    setState(() {
      page = pageController.page ?? 0;
    });
  }

  @override
  void initState() {
    pageController.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_onListener);
    pageController.dispose();
    super.dispose();
  }

  void _animateTo(
    int page, {
    Duration duration = const Duration(milliseconds: 700),
  }) {
    if (page < 0 || page > controller.chuteras.length - 1) return;
    pageController.animateToPage(page.round(),
        duration: duration, curve: Curves.elasticOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final height = constraints.maxHeight;
                  final width = constraints.maxWidth;
                  final size = width * 0.6;
                  final backgroundPosition = -height / 2;
                  return Stack(
                    children: [
                      Positioned(
                        top: backgroundPosition,
                        left: backgroundPosition,
                        right: backgroundPosition,
                        bottom: size / 2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColor.backgroundColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 140,
                        child: PriceWidget(shopping: controller.chuteras.first),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 70,
                        child: TitleWidget(shopping: controller.chuteras.first),
                      ),
                      const Positioned(
                        left: 10,
                        top: 65,
                        child: Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Listener(
                        onPointerUp: (_) {
                          _animateTo(page.round());
                        },
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: controller.chuteras.length,
                          onPageChanged: (index) {
                            controller.chuteras.first =
                                controller.chuteras[index];
                          },
                          itemBuilder: (context, index) {
                            final model = controller.chuteras[index];
                            final percent = page - index;
                            final opacity = 1.0 - percent.abs();
                            final verticalSpace = size / 1.2;
                            final radius = height - verticalSpace;
                            final x = radius * sin(percent);
                            final y =
                                radius * cos(percent) - height + verticalSpace;

                            return Opacity(
                              opacity:
                                  opacity < 0.3 ? 0.0 : opacity.clamp(0.0, 1.0),
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..translate(x, y)
                                  ..rotateZ(percent),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child:
                                        CircularTens(model: model, size: size)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            BodyListWidget(controller: controller)
          ],
        ));
  }
}
