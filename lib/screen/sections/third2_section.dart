import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/item_card.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Third2Section extends StatefulWidget {
  const Third2Section({super.key});

  @override
  State<Third2Section> createState() => _Third2SectionState();
}

class _Third2SectionState extends State<Third2Section> with SingleTickerProviderStateMixin {
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
        if (current.scrollOffsetValue > 2500 || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > 2500) {
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
                  Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeTransition(
                            opacity: headingTextOpacity,
                            child: Text(
                              '유지 및 관리',
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
                              '영상 소스를 지속 관리하고\n권리 사후 처리를\n도와드려요',
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
                              '드라이브를 통해 영상소스를\n지속 관리하고 영상 사용 권리에 관한\n사후 처리를 지원합니다.',
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  const Flexible(
                    // flex: 1,
                    child: ItemCard(
                      image: 'assets/images/section2_3.png',
                        scrollMin: 2500,
                        scrollMax: 3050
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
