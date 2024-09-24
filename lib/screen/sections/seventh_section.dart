import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/item_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:crypto_ui_web/share/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;

class SeventhSection extends StatefulWidget {
  const SeventhSection({super.key});

  @override
  State<SeventhSection> createState() => _SeventhSectionState();
}

class _SeventhSectionState extends State<SeventhSection> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> planAnimation;

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
    planAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
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
          color: AngleroColor.white,
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
                        'Be Anglero’s Partner',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AngleroColor.black, fontSize: 44, fontWeight: FontWeight.w700, height: 1),
                      ),
                  ),
                  const SizedBox(height: 30),
                  FadeTransition(
                    opacity: headingTextOpacity,
                    child: AngleroText(
                      '직접 촬영한 소중한 영상소스를 더 다양한 작품에서 만나볼 수 있도록\n앵글로의 파트너가 되어주세요.\n앵글로는 국내 유일 <em>영상소스 배급 서비스</em>를 통해 국내 영상제작자들을 연결하고 싶습니다.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AngleroColor.black, fontSize: 24, fontWeight: FontWeight.w300, height: 1.8),
                      emStyle: const TextStyle(color: AngleroColor.black, fontSize: 24, fontWeight: FontWeight.w600, height: 1.8),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            4,
                                (index) => Row(
                              children: [
                                if(index == 0)...[
                                  const SizedBox(
                                    width: 40,
                                  ),
                                ],
                                ScaleTransition(
                                  scale: planAnimation,
                                  child: Image.asset(
                                    'assets/images/section7_${index + 1}.png',
                                    width: 270,
                                    height: 270,
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                              ],
                            )),
                      )),
                  const SizedBox(
                    height: 120,
                  ),

                  FadeTransition(
                    opacity: subTextOpacity,
                    child: const Text(
                      '앵글로는 모든 영상을 수집하고, 가공/유통합니다',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w300, height: 1.4),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: planAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '회사소개서',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500, height: 1.8),
                            ),
                            const SizedBox(height:  20),
                            Image.asset(
                              'assets/images/paper.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height:  20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: (){
                                  html.window.location.href = 'https://anglero.notion.site/10617cecd77980dd9802e8ef44aad5e4?pvs=4';
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.transparent
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'DOWNLOAD',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500, height: 1.8),
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset(
                                        'assets/images/download.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width:  200),
                      ScaleTransition(
                        scale: planAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '파트너 제안서',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500, height: 1.8),
                            ),
                            const SizedBox(height:  20),
                            Image.asset(
                              'assets/images/deal.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height:  20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: (){
                                  html.window.location.href = 'https://anglero.notion.site/10617cecd779803d828cfdd966834136?pvs=4';
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.transparent
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'DOWNLOAD',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500, height: 1.8),
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset(
                                        'assets/images/download.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width:  200),
                      ScaleTransition(
                        scale: planAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '파트너 신청',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500, height: 1.8),
                            ),
                            const SizedBox(height:  20),
                            Image.asset(
                              'assets/images/writing-tool.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height:  20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: (){
                                  html.window.location.href = 'https://forms.gle/bRwj6sCoE3unY4gJA';
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.transparent
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'GO TO LINK',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500, height: 1.8),
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset(
                                        'assets/images/arrow-top-right.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
