import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:newlogin/app/modules/home/views/fore_ground_down_view.dart';
import 'package:newlogin/app/modules/home/views/fore_ground_up_view.dart';
import 'package:newlogin/app/modules/location_select/views/location_select_view.dart';
import 'package:newlogin/app/routes/app_pages.dart';
import 'package:newlogin/screens/home_page.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('వాతావరణం'),
          backgroundColor: Colors.teal[300],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
          child:GetBuilder<HomeController>(
          init: controller,
          builder
          : (controller) {
              return GestureDetector(
                child: Container(
                  color: controller.theme.appColorTheme.colorBackground,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: controller
                                  .theme.appColorTheme.colorBackground,
                              boxShadow: [
                                controller.theme.appColorTheme.shadowMediumUp
                              ]),
                          child: !controller.loadingState
                              ? Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: controller.theme.appColorTheme
                                            .colorBackground,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: controller.size.height / 2,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                        .theme
                                                        .appColorTheme
                                                        .graphColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: controller.size.height /
                                                    1.6,
                                                child: ClipRRect(
                                                  child: SvgPicture.asset(
                                                    controller
                                                        .theme.appSvgImages
                                                        .getAnImage(controller
                                                            .appSettings
                                                            .currentLocation),
                                                    fit: BoxFit.cover,
                                                    width:
                                                        controller.size.width,
                                                  ),
                                                )),
                                            ForeGroundUpView(),
                                          ],
                                        )),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: controller.size.height /
                                                      4),
                                              child: SvgPicture.asset(
                                                controller.theme.appSvgImages
                                                    .mainVector,
                                                fit: BoxFit.fill,
                                                width: controller.size.width,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height:
                                                      controller.size.height /
                                                          2.6,
                                                ),
                                                ForeGroundDownView()
                                              ],
                                            ),
                                          ]),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: controller.size.height * 0.04),
                                        child: Column(children: [
                                          controller.components.menuButton(
                                              onClick: () {
                                                controller
                                                    .onLocationPageClicked();
                                              },
                                              color: Colors.transparent,
                                              icon: Icon(
                                                Icons.location_on_rounded,
                                                color: controller.theme
                                                    .appColorTheme.colorBlack,
                                              )),
                                          controller.components.menuButton(
                                              onClick: () {
                                                controller.onRefresh();
                                              },
                                              color: Colors.transparent,
                                              icon: Icon(
                                                Icons.refresh_rounded,
                                                color: controller.theme
                                                    .appColorTheme.colorBlack,
                                              )),
                                        ])),
                                  ],
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: RefreshProgressIndicator(
                                    backgroundColor: controller
                                        .theme.appColorTheme.colorBackground,
                                  ),
                                ))
                    ],
                  ),
                ),
              );
            }
            )
    )));
  }
}
