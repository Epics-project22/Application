import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newlogin/app/modules/home/controllers/home_controller.dart';

class PeriodChooserView extends GetView<HomeController> {
  late List<bool> state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          state = controller.periodChooserState;
          return Container(
            child: Row(
              children: [
                SizedBox(
                  width: controller.size.width * 0.1,
                ),
                buttonChooser(title: "Today", index: 0),
                SizedBox(
                  width: 10,
                ),
                buttonChooser(title: "Tommorrow", index: 1),
                SizedBox(
                  width: 10,
                ),
                buttonChooser(title: "Week", index: 2),
                Spacer(),
              ],
            ),
          );
        });
  }

  Widget buttonChooser({required String title, required int index}) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: controller.size.width / 4,
          height: controller.size.height / 20,
          margin: state[index] ? EdgeInsets.only(top: 2) : EdgeInsets.zero,
          decoration: BoxDecoration(
              color: !state[index]
                  ? Colors.teal.withOpacity(0.7)
                  : controller.theme.appColorTheme.color1,
              borderRadius: BorderRadius.circular(8),
              boxShadow: !state[index]
                  ? [controller.theme.appColorTheme.shadowMedium]
                  : []),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                state = [false, false, false];
                state[index] = !state[index];
                controller.changePeriodChooserState(state);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: FittedBox(
                  child: Text(
                    "$title",
                    style: controller.theme.appTextTheme.txt12white
                        .copyWith(fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
