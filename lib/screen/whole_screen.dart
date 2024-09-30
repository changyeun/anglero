import 'package:crypto_ui_web/screen/sections/eighth_section.dart';
import 'package:crypto_ui_web/screen/sections/fifth_section.dart';
import 'package:crypto_ui_web/screen/sections/forth_section.dart';
import 'package:crypto_ui_web/screen/sections/ninth_section.dart';
import 'package:crypto_ui_web/screen/sections/second_section.dart';
import 'package:crypto_ui_web/screen/sections/seventh_section.dart';
import 'package:crypto_ui_web/screen/sections/third1_section.dart';
import 'package:crypto_ui_web/screen/sections/third2_section.dart';
import 'package:crypto_ui_web/screen/sections/third_section.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/screen_offset.dart';
import 'sections/first_sections.dart';
import 'sections/sixth_section.dart';

class WholeScreen extends StatefulWidget {
  const WholeScreen({super.key});

  @override
  State<WholeScreen> createState() => _WholeScreenState();
}

class _WholeScreenState extends State<WholeScreen> {

  @override
  void initState() {
    AngleroConst.scrollController.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + AngleroConst.scrollController.position.pixels)
              .toInt());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: AngleroConst.scrollController,
      children: const [
        FirstSection(),
        // SecondScreen(),
        ThirdSection(),
        Third1Section(),
        Third2Section(),
        ForthSection(),
        SizedBox(
          height: 50.0,
        ),
        FifthSection(),
        SixthSection(),
        SeventhSection(),
        EighthSection(),
        NinthSection(),
      ],
    );
  }
}
