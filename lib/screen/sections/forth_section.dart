import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/item_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;

class ForthSection extends StatefulWidget {
  const ForthSection({super.key});

  @override
  State<ForthSection> createState() => _ForthSectionState();
}

class _ForthSectionState extends State<ForthSection> with SingleTickerProviderStateMixin {
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
        if (current.scrollOffsetValue > 2900 || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > 2900) {
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
                    child: const Text(
                      '영상소스의 수급과 관리\n후가공까지 모두 한 번에',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AngleroColor.white, fontSize: 60, fontWeight: FontWeight.w500, height: 1.3),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeTransition(
                    opacity: headingTextOpacity,
                    child: const Text(
                      '앵글로는 영상소스 제공 뿐만 아니라 편집과 색보정, 트렌스코딩까지\n영상 제작에 필요한 모든 절차를 체계적이고 합리적으로 제안합니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, height: 1.5),
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
                          html.window.location.href = 'https://forms.gle/vTyZVssswqn8kcY49';
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16),
                          decoration: BoxDecoration(
                            color: AngleroColor.red_200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            '무료로 상담하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500, height: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 138,
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
