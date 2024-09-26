import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/item_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Third1Section extends StatefulWidget {
  const Third1Section({super.key});

  @override
  State<Third1Section> createState() => _Third1SectionState();
}

class _Third1SectionState extends State<Third1Section> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;
  late Animation<Offset> offsetImage;
  late Animation<Offset> transform;

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

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));
    offsetImage = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));


    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));
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
        if (current.scrollOffsetValue > 2000 || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > 2000) {
          controller.forward();
        } else {
          // controller.reverse();
        }
        return Container(
          color: AngleroColor.black,
          child: Column(
            children: [
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    // flex: 1,
                    child: ItemCard(
                      image: 'assets/images/section2_2.png',
                        scrollMin: 2200,
                        scrollMax: 2500
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeTransition(
                            opacity: headingTextOpacity,
                            child: Text(
                              '편집 및 후가공 서비스',
                              style: TextStyle(
                                  color: AngleroColor.red_200,
                                  fontSize: 14* (MediaQuery.of(context).size.width /1728),
                                  fontWeight: FontWeight.w600,
                                  height: 1
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeTransition(
                            opacity: headingTextOpacity,
                            child: Text(
                              '컷 편집 부터\n트랜스코딩 까지\n다양한 후가공 서비스를\n지원해드려요',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 44* (MediaQuery.of(context).size.width /1728),
                                  fontWeight: FontWeight.w700,
                                  height: 1.3
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeTransition(
                            opacity: descriptionOpacity,
                            child: Text(
                              '원하는 영상에 바로 사용할 수 있도록,\n컷편집부터 색보정, 트렌스코딩 등\n모든 후가공 서비스를 제공합니다.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14* (MediaQuery.of(context).size.width /1728),
                                  fontWeight: FontWeight.w500,
                                  height: 1.8
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
