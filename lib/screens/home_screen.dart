import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weave_test/controller/home_controller.dart';
import 'package:weave_test/screens/tabs/first_tab.dart';
import 'package:weave_test/widgets/tab_bar_item_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("States"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12),
            color: Colors.red,
            child: TabBar(
              controller: controller.tabController,
              tabs: const [
                TabBareItemWidget(title: "First"),
                TabBareItemWidget(title: "Second")
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                FirstTab(),
                Icon(Icons.directions_transit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
