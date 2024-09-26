import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/text_transform.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:crypto_ui_web/share/utils.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../widget/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      // reverseDuration: const Duration(
      //   milliseconds: 375,
      // ),
    );

    textRevealAnimation = Tween<double>(begin: 60.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.2, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      decoration: const BoxDecoration(color: AppColors.scaffoldColor),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
                'assets/images/img_main_background.png',
                fit: BoxFit.cover,
              ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextReveal(
                  maxHeight: 100,
                  controller: controller,
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  child: Text(
                    '효율적인 영상 제작을 위한',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 60 * (MediaQuery.of(context).size.width /1728),
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextReveal(
                  maxHeight: 100,
                  controller: controller,
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  child: AngleroText(
                    '국내 유일 영상소스 유통, <em>앵글로</em>입니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 60 * (MediaQuery.of(context).size.width /1728),
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                      emStyle: TextStyle(
                          fontSize: 60 * (MediaQuery.of(context).size.width /1728),
                          color: AngleroColor.red_200,
                          fontWeight: FontWeight.w700)
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextTransform(
                  maxHeight: 100,
                  controller: controller,
                  textOpacityAnimation: textOpacityAnimation,
                  textRevealAnimation: textRevealAnimation,
                  child: AngleroText(
                    '앵글로는 <em>지역별로 수집, 분류한 국내 영상 콘텐츠</em>를 기반으로\n영상소스가 필요한 이들에게 맞춤 솔루션을 제공합니다. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24 * (MediaQuery.of(context).size.width /1728),
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                    emStyle: TextStyle(
                        fontSize: 24 * (MediaQuery.of(context).size.width /1728),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    html.window.location.href = 'https://forms.gle/vTyZVssswqn8kcY49';
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AngleroColor.white,
                      ),
                      child: Text(
                        '무료로 상담하기',
                        style: TextStyle(
                          fontSize: 24 * (MediaQuery.of(context).size.width /1728),
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 775));

    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
    Future.delayed(const Duration(milliseconds: 375), () {
      if (_controller.isDismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              height: 920.0,
              width: double.infinity,
              child: child,
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: _animation.value,
            //     width: double.infinity,
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           AppColors.scaffoldColor,
            //           AppColors.secondaryColor,
            //         ],
            //         tileMode: TileMode.mirror,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
      // child: Transform.scale(
      //   scale: 1,
      //   child: Image.asset(
      //     'assets/images/img_main_background.png',
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }
}
