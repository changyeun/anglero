import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCard extends StatefulWidget {
  final String image;
  final double scrollMin;
  final double scrollMax;
  const ItemCard(
      {required this.image,
        required this.scrollMin,
        required this.scrollMax,
      super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController controller;

  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 500));

    imageReveal = Tween<double>(begin: 00.0, end: 170.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.50, curve: Curves.easeInOutCubic)));

    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

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

    // priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //     parent: controller,
    //     curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));
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
    return Container(
      height: 345,
      width: 400,
      child: BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
          if ((current.scrollOffsetValue >= widget.scrollMin &&
                  current.scrollOffsetValue <= widget.scrollMax) ||
              controller.isAnimating) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          if (state.scrollOffsetValue >= (widget.scrollMin)) {
            controller.forward();
          }
          // else {
          //   controller.reverse();
          // }
          return AnimatedBuilder(
              animation: imageOpacity,
              builder: (context, child) {
                return SizedBox(
                  height: 488.0* (MediaQuery.of(context).size.width /1728),
                  width: 488.0* (MediaQuery.of(context).size.width /1728),
                  child: Center(
                    child: FadeTransition(
                      opacity: imageOpacity,
                      child: SizedBox(
                        height: 488.0* (MediaQuery.of(context).size.width /1728),
                        width: 488.0* (MediaQuery.of(context).size.width /1728),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.medium,
                            scale: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
