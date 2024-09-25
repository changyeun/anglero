import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/plan_item.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:crypto_ui_web/share/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({super.key});

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> planAnimation;
  late Animation<double> subImageRevealAnimation;
  late Animation<Offset> offsetImage;
  late Animation<Offset> transform;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    planAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    offsetImage = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        if ((current.scrollOffsetValue >= 3000 && current.scrollOffsetValue <= 3800) || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        //print(state.scrollOffsetValue);
        if (state.scrollOffsetValue > 3500.0) {
          //print(state.scrollOffsetValue);
          controller.forward();
        } else {
          // controller.reverse();
        }
        return Column(
          children: [
            const SizedBox(height: 150),
            AnimatedBuilder(
              animation: textRevealAnimation,
              builder: (context, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextReveal(
                            maxHeight: 100,
                            controller: controller,
                            child: const Text(
                              '최신 콘텐츠',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AngleroColor.red_200,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextReveal(
                            maxHeight: 200,
                            controller: controller,
                            child: const Text(
                              '편집 마감에 쫓기지 않도록\n국내에서 촬영된 전문적인 영상을\n빠르게 제공받으세요',
                              style: TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 40),
                          TextReveal(
                            maxHeight: 50,
                            controller: controller,
                            child: AngleroText(
                              '<em>단일 클립부터 장기 프로젝트</em>까지 앵글로에게 맡겨주세요\n(단일 클립 기준 평균 2~3일 소요)',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                              emStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 150),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => Row(
                            children: [
                              if(index == 0)...[
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                              ScaleTransition(
                                scale: planAnimation,
                                child: Image.asset(
                                  'assets/images/section5_${index + 1}.png',
                                  width: 374,
                                  height: 374,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )),
                )),
            const SizedBox(height: 150),
          ],
        );
      },
    );
  }
}
