import 'package:flutter/material.dart';

class TabBareItemWidget extends StatelessWidget {
  final String title;

  const TabBareItemWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text(title)));
  }
}
