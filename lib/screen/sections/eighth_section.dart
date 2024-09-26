import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EighthSection extends StatefulWidget {
  const EighthSection({super.key});

  @override
  State<EighthSection> createState() => _EighthSectionState();
}

class _EighthSectionState extends State<EighthSection> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> textRevealEndAnimation;
  late Animation<double> subTextOpacityAnimation;
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

    textRevealEndAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));
    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));
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
    int aniHeight = MediaQuery.of(context).size.width< 1000 ? 5500: 7000;
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        if (current.scrollOffsetValue > aniHeight || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.scrollOffsetValue > aniHeight) {
          controller.forward();
        } else {
          // controller.reverse();
        }
        return Column(
          children: [
            Container(
              height: 150,
            ),
            AnimatedOpacity(
              curve: Curves.easeInCubic,
              opacity: state.scrollOffsetValue > aniHeight ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                '국내 유일 영상소스 배급 서비스',
                style: TextStyle(color: Colors.white, fontSize: 24* (MediaQuery.of(context).size.width /1728), fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: 30,
            ),
            AnimatedOpacity(
                curve: Curves.easeInCubic,
                opacity: state.scrollOffsetValue > aniHeight ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  'assets/images/Frame 19.png',
                  height: 89* (MediaQuery.of(context).size.width /1728),
                )),
            const SizedBox(
              height: 60,
            ),
            AnimatedOpacity(
              curve: Curves.easeInCubic,
              opacity: state.scrollOffsetValue > aniHeight ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                '영상소스를 얻기 위해 소요됐던 수많은 시간들,\n이제 소스를 구하는 걱정 없이 ‘영상 콘텐츠의 퀄리티’에만 집중하세요',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24* (MediaQuery.of(context).size.width /1728), fontWeight: FontWeight.w300, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            AnimatedOpacity(
              curve: Curves.easeInCubic,
              opacity: state.scrollOffsetValue > aniHeight ? 1 : 0.1,
              duration: const Duration(milliseconds: 500),
              child: Text(
              '앵글로는 더 효율적이고, 더 완벽한 국내 영상 산업을 꿈꿉니다',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 44* (MediaQuery.of(context).size.width /1728), fontWeight: FontWeight.w700, height: 1.5),
              ),
            ),
            Container(
              height: 150,
            ),
          ],
        );
      },
    );
  }
}
