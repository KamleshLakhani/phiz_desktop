
import 'package:flutter/material.dart';


Widget getWebLeftEmptyWidget(context) => SizedBox(
  width: MediaQuery.of(context).size.width * 0.15,
  // width: MediaQuery.of(context).size.width * webLeftSpace,
  // width: webLeftSpace.sw,
);

Widget getWebRightEmptyWidget(context) => SizedBox(
  width: MediaQuery.of(context).size.width * 0.008,
  // width: MediaQuery.of(context).size.width * webRightSpace,
  // width: webRightSpace.sw,
);