import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/item_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;

class SixthSection extends StatefulWidget {
  const SixthSection({super.key});

  @override
  State<SixthSection> createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;

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

    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));
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
        if (current.scrollOffsetValue > 4200 || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > 4200) {
          controller.forward();
        } else {
          // controller.reverse();
        }
        return Container(
          color: AngleroColor.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: headingTextOpacity,
                    child: Image.asset(
                      'assets/images/section6_title.png', height: 89,)
                  ),
                  const SizedBox(height: 60),
                  FadeTransition(
                    opacity: headingTextOpacity,
                    child: const Text(
                      '오직 국내 영상 제작자를 위해 태어났습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AngleroColor.white, fontSize: 44, fontWeight: FontWeight.w700, height: 1.3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeTransition(
                    opacity: headingTextOpacity,
                    child: const Text(
                      '앵글로는 지역별로 수집, 분류한 국내 영상소스를\n개별 영상소스 공급 계약과 영상소스 스톡 사이트를 통해 영상소스를 제공합니다.\n지역별 키워드 분류와 필터 시스템으로 더 빠르고, 효율적으로 영상을 다운로드하세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300, height: 1.8),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeTransition(
                    opacity: subTextOpacity,
                    child: const Text(
                      'Coming Soon !',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AngleroColor.red_200, fontSize: 24, fontWeight: FontWeight.w700, height: 1.8),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  FadeTransition(
                    opacity: descriptionOpacity,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          html.window.location.href = 'www.anglero.kr';
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.5, vertical: 16),
                          decoration: BoxDecoration(
                            color: AngleroColor.red_200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Footage 둘러보기',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600, height: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
