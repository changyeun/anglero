import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/share/utils.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class NinthSection extends StatefulWidget {
  const NinthSection({super.key});

  @override
  State<NinthSection> createState() => _NinthSectionState();
}

class _NinthSectionState extends State<NinthSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Frame 19.png',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (){
                              html.window.location.href = 'https://anglero.notion.site/10617cecd77980ebad3bf01d9897604a?pvs=4';
                            },
                            child: const Text(
                              '이용약관',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (){
                              html.window.location.href = 'http://anglero.notion.site';
                            },
                            child: const Text(
                              '개인정보처리방침',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          html.window.location.href = 'https://www.instagram.com/anglero.kr/';
                        },
                        child: Image.asset(
                          'assets/images/insta.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '서울특별시 광진구 능동로 120,(화양동, 건국대학교) KU혁신기술관 601호\n제주특별자치도 제주시 원남6길 58(도남동), 2층 201호',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        height: 1.4
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AngleroText(
                      '<em>CEO</em>  박경진   |   <em>E</em>  contact@anglero.kr   |   <em>P</em>  010-7303-2419   |   <em>사업자 등록번호</em>  536-10-02317',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      emStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
