// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class KhalilWebPage extends StatefulWidget {
  const KhalilWebPage();

  @override
  KhalilWebPageState createState() => KhalilWebPageState();
}

double shared_screenW = 0;

class KhalilWebPageState extends State<KhalilWebPage> {
  final Uri _githubUrl = Uri.parse('https://github.com/khalil-allam');
  final Uri _documentUrl = Uri.parse(
      'https://drive.google.com/drive/folders/180NwqlFhvZ3Dww7QMcp3y6RrphMM8cvn?usp=drive_link');
  final Uri _googleSlidesUrl = Uri.parse(
      'https://docs.google.com/presentation/d/1ejzUKNPAyOrcWy1YUHxdfoqXFexGyVcLf3UG_-6T6-U/edit?usp=sharing');

  final Uri _macosUrl = Uri.parse(
      'https://drive.google.com/drive/folders/12XXq8ScXdqK-TsuApqisgR9qYNnCaBoq?usp=drive_link');
  final Uri _windowsUrl = Uri.parse(
      'https://drive.google.com/drive/folders/1x3rKbJqirBKZLb9hYhAQrdGaY6eU6u2R?usp=drive_link');
  final Uri _androidUrl = Uri.parse(
      'https://drive.google.com/drive/folders/1x7XED42lzY6TcSBIG-eOQN_VTWkKGXCq?usp=drive_link');

  @override
  Widget build(BuildContext context) {
    double screenWiedth = MediaQuery.sizeOf(context).width;
    shared_screenW = screenWiedth;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: mainGreenColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: whiteColor),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'KHALIL',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: "ReemKufi",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                'A SOLUTION FOR ALLAM CHALLENGE 2024',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: "ReemKufi",
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  launchUrl(_documentUrl);
                },
                tooltip: "Khalil Document",
                icon: Icon(FontAwesomeIcons.fileArrowDown)),
            IconButton(
                onPressed: () {
                  launchUrl(_googleSlidesUrl);
                },
                tooltip: "Khalil Slides",
                icon: Icon(FontAwesomeIcons.googleDrive)),
            IconButton(
                onPressed: () {
                  launchUrl(_githubUrl);
                },
                tooltip: "Github Repo",
                icon: Icon(FontAwesomeIcons.github)),
            // _SampleMenu(_controller),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 770,
                child: Stack(
                  children: [
                    screenWiedth >= 950
                        ? Positioned(
                            bottom: 1,
                            right: 1,
                            left: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 500,
                                  width: 900,
                                  margin: EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                      color: secondGreenColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(2500),
                                          topLeft: Radius.circular(2500))),
                                ).animate().fade().scale(
                                    duration: Duration(milliseconds: 500)),
                              ],
                            ),
                          )
                        : Positioned(
                            left: 1,
                            child: Container(
                              height: 400,
                              width: 400,
                              margin: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: secondGreenColor,
                                  borderRadius: BorderRadius.circular(800)),
                            ),
                          )
                            .animate()
                            .fade()
                            .scale(duration: Duration(milliseconds: 500)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 700,
                          child: Stack(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 312,
                                    height: 675,
                                    padding: EdgeInsets.all(5),
                                    color: mainGreenColor,
                                    child: 
                                    Swiper(
                                    itemBuilder: (context, index){
                                        return Center(
                                          child: Image(
                                            image: AssetImage("assets/images/app_${index.toString()}.jpg"),
                                          ));
                                      },
                                      autoplay: true,
                                      itemCount: 11,
                                      pagination: const SwiperPagination(),
                                      // control: const SwiperControl(),
                                       ),
                                    )
                                  ),
                              ),
                              Center(
                                child: Container(
                                  width: 400,
                                  height: 700,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/phone.png"),
                                          fit: BoxFit.contain)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                SizedBox(width: 5,),
                os_download_buttons("Khalil for Android", "Get Khalil for android", _androidUrl, FontAwesomeIcons.android),
                SizedBox(width: 5,),
                os_download_buttons("Khalil for Windows", "Get Khalil for windows", _windowsUrl, FontAwesomeIcons.windows),
                SizedBox(width: 5,),
                os_download_buttons("Khalil for macOS", "Get Khalil for mac", _macosUrl, FontAwesomeIcons.apple),
                SizedBox(width: 5,),
              ],),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Sponsered By: ",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: "ReemKufi",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sponsors_logo('allam_logo'),
                  sponsors_logo('sadaia_logo'),
                  sponsors_logo('sfcpd_logo'),
                ],
              )
            ],
          ),
        ),
      ),
    );  
  }
  
Widget os_download_buttons(
  String osText,
  String tooltip,
  Uri url,
  IconData Icon_data
){
  return Expanded(
    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                backgroundColor: secondGreenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                    onPressed: (){
                     launchUrl(url);
                    },
                    child: Column(
                      children: [
                       shared_screenW <= 500 ? 
                       Text(
                        osText.substring(11),
                        style: TextStyle(
                            color: secondBegiColor,
                            fontFamily: "ReemKufi",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),) 
                          : 
                       Text(
                        osText,
                        style: TextStyle(
                            color: secondBegiColor,
                            fontFamily: "ReemKufi",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),),
                        IconButton(
                        onPressed: () {
                           launchUrl(url);
                        },
                        tooltip: tooltip,
                        icon: Icon(Icon_data)),
                      ],
                    ),
                  ),
  );
}

Widget sponsors_logo(String imageAsset) {
    return Expanded(
      child: Center(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/$imageAsset.png"),
                  fit: BoxFit.scaleDown)),
        ),
      ),
    );
  }

  }