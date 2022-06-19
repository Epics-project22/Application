import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newlogin/app/modules/home/controllers/home_controller.dart';
import 'package:newlogin/app/modules/home/views/period_chooser_view.dart';

class ForeGroundDownView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          var chart = controller.chart;
          return Container(
            color: Colors.transparent,
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(left: controller.size.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    controller.components.squareButton(
                        controller: controller,
                        title: "Uv index",
                        icon: controller.theme.appSvgImages.uvi,
                        value: ((controller.switcherState
                                ? controller.data.uvi
                                : controller.data.tommorrowData.uvi))
                            .ceilToDouble()
                            .toString(),
                        unit: "mW/sqm",
                        color: controller.theme.appColorTheme.color1),
                    controller.components.squareButton(
                        controller: controller,
                        title: "Wind",
                        icon: controller.theme.appSvgImages.wind,
                        value: controller.switcherState
                            ? controller.data.currentWind.toString()
                            : controller.data.tommorrowData.wind.toString(),
                        unit: "km/h",
                        color: controller.theme.appColorTheme.color2),
                    controller.components.squareButton(
                        controller: controller,
                        title: "Humidity",
                        icon: controller.theme.appSvgImages.droplet,
                        value: controller.switcherState
                            ? controller.data.currentHumidity.toString()
                            : controller.data.tommorrowData.humidity.toString(),
                        unit: "g.m",
                        color: controller.theme.appColorTheme.color3),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: controller.size.height *
                        controller.size.height *
                        (Get.context!.textScaleFactor > 1.0
                            ? 0.00043
                            : 0.00046),
                child: Row(
                  children: [
                    Expanded(
                        child: chart
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft, child: PeriodChooserView()
              ),
              ]
            ),
          );
        }
     );
  }
}