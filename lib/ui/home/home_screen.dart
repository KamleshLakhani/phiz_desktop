import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:phiz_desktop/utils/extensions/size_extension.dart';

import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_web_scaffold.dart';

class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);
  int i = 0;

  final List<_PieData> _pieData = [
    _PieData(Other, 30000, '71.4%'),
    _PieData(Salary, 50000, '12.8%'),
    _PieData(Officemaintenance, 50000, '15.8%'),
  ];

  @override
  Widget build(BuildContext context) {

    return CustomWebScaffold(
      title: 'flutter',
      child: Column(
        children: [

        ],
      ),
    );
  }

  Widget User(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.dynamicSize(
          Utils.getWidth(context) * 0.05,
          1.0,
          1.0,
          Utils.getWidth(context) * 0.02,
        ),
        vertical: context.dynamicSize(
          Utils.getWidth(context) * 0.015,
          1.0,
          1.0,
          Utils.getWidth(context) * 0.005,
        ),
      ),
      child: Card(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.supervised_user_circle,
                size: 30,
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text("NAVRANG IMPEX"),
            ),
            Expanded(
              flex: 1,
              child: Text("₹ 1,065.00"),
            ),
          ],
        ),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);

  final String xData;
  final num yData;
  final String text;
}
