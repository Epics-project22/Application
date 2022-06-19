import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newlogin/app/modules/home/controllers/home_controller.dart';

class ForeGroundUpView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(
                bottom: controller.size.height / 6,
                right: controller.size.width * 0.06),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                  color: const Color(0xFF525893).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                padding: EdgeInsets.only(right: 20,left:20, top: 30,bottom:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: Text(
                        controller.data.cityName,
                        style: controller.theme.appTextTheme.txt32white,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    FittedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                ((controller.switcherState
                                    ? controller.data
                                    .currentTemperature
                                    : controller
                                    .data
                                    .tommorrowData
                                    .temperature) -
                                    273.75)
                                    .ceil()
                                    .toString() +
                                    "°c",
                                style: controller
                                    .theme.appTextTheme.txt60white
                                    .copyWith(height: 0.1),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            controller.theme.appPngImages.getWeatherIcon(
                                controller.data.weatherIcon),
                            height: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.switcherState
                                ? controller.data.currentWeather
                                : controller.data.tommorrowData.weather,
                            style:
                            controller.theme.appTextTheme.txt32white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
