import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/whole_screen.dart';
import 'package:crypto_ui_web/share/anglero_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anglero',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Pretendard"
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 430 * (MediaQuery.of(context).size.width /1728),
        backgroundColor: AngleroColor.appbarColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 10 * (MediaQuery.of(context).size.width /1728) , top: 21, bottom: 21),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                html.window.location.href = '/';
              },
              child: SizedBox(
                height: 57,
                child: Image.asset(
                  'assets/images/Frame 19.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 70 * (MediaQuery.of(context).size.width /1728)),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async{
                  html.window.location.href = 'https://forms.gle/vTyZVssswqn8kcY49';
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11.5),
                  decoration: BoxDecoration(
                    color: AngleroColor.red_200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '문의하기',
                    style: TextStyle(
                        fontSize: 14,
                        color: AngleroColor.white,
                        height: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: BlocProvider(
        create: (context) => DisplayOffset(ScrollOffset(scrollOffsetValue: 0)),
        child: const WholeScreen(),
      ),
    );
  }
}
