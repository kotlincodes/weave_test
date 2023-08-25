import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weave_test/controller/home_controller.dart';

class FirstTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.getData.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => controller.onHorizontalTap(index),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              controller.getStateName(index),
                              style: TextStyle(
                                  color: index == controller.selectedIndex
                                      ? Colors.green
                                      : Colors.black),
                            ),
                          ),
                        );
                      })),
                ),
                Expanded(
                  child: ScrollablePositionedList.builder(
                      itemScrollController: controller.scrollController,
                      itemCount: controller.getData.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => controller.onTapExpandableWidget(index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.getStateName(index),
                                  style: TextStyle(
                                      color: index == controller.selectedIndex
                                          ? Colors.green
                                          : Colors.black),
                                ),
                                ExpandablePanel(
                                  controller: ExpandableController(
                                      initialExpanded:
                                          controller.selectedIndex == index ||
                                              controller.expandedList
                                                  .contains(index)),
                                  collapsed: const SizedBox.shrink(),
                                  expanded: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .getCityList(index)
                                                .length,
                                            itemBuilder:
                                                (context, expandItemIndex) {
                                              return Text(
                                                controller.getCityList(
                                                    index)[expandItemIndex],
                                                style: TextStyle(
                                                    color: Colors.red),
                                              );
                                            }),
                                      ),
                                      // ExpandableButton(
                                      //   child: Icon(Icons.arrow_upward),
                                      // )
                                    ],
                                  ),
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ],
            );
    });
  }
}
