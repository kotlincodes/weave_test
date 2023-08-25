import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late ExpandableController expandableController;
  late Map<String, dynamic> _data;
  List<int> expandedList = [];

  bool isLoading = true;
  int selectedIndex = -1;
  ItemScrollController scrollController = ItemScrollController();

  Map<String, dynamic> get getData => _data;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    expandableController = ExpandableController(initialExpanded: true);

    _getData();
  }

  Future<void> _getData() async {
    _data = jsonDecode(await rootBundle.loadString("assets/json/states.json"));
    isLoading = false;

    update();
  }

  void onHorizontalTap(int index) {
    selectedIndex = index;
    scrollController.jumpTo(index: index);
    if (!expandedList.contains(index)) {
      expandedList.remove(index);
    }
    update();
  }

  String getStateName(int index) {
    return _data.entries.toList()[index].key;
  }

  List<dynamic> getCityList(int index) => _data.entries.toList()[index].value;
}
