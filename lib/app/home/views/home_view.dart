import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_app/app/home/controllers/home_controller.dart';
import 'package:testing_app/shared/utils.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AngleroColor.background,
        appBar: AppBar(
          title: Text('sdafdsdsaf'),
          elevation: 4,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //section1
              Image.asset('assets/img/main_img.png', width: Get.width),

              //section2
              Image.asset('assets/img/img_section2_first.png', width: 488,),


              //section2
              Wrap(
                children: List.generate(6,
                        (index) => Image.asset('assets/img/img_gallery_${index+ 1}.png', width: 440,),
                )
              )
            ],
          ),
        ));
  }
}
