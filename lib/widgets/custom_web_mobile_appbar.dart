
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' hide Provider;
import 'package:phiz_desktop/provider/app_state_provider.dart';
import 'package:provider/provider.dart';


import '../di/locator.dart';
import '../utils/color_utils.dart';
import '../utils/constants/app_constant.dart';
import '../utils/constants/fontsize_constant.dart';
import '../utils/extensions/size_extension.dart';
import '../utils/image_utils.dart';
import '../utils/utils.dart';

class CustomAppBar extends HookConsumerWidget with PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.elevation,
    this.isHome,
    this.widget,
    this.color,
    this.isTrailing = true,
    required this.contexts,
    this.alwaysShowHamburger = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final double? elevation;
  final Widget? widget;
  final Color? color;
  final BuildContext contexts;
  final bool alwaysShowHamburger;
  final bool? isHome;
  final bool? isTrailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: color,
      toolbarHeight: context.dynamicSize(48.c, 66.c),
      elevation: appBarElevation,
      shadowColor: topElevationColor,
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: () {
                if (context.isDesktop) {
                  Provider.of<AppStateProvider>(context, listen: false)
                      .changeIsWebDrawerOpen();
                } else if (alwaysShowHamburger) {
                  Scaffold.of(context).openDrawer();
                } else if (isHome == true) {
                  Scaffold.of(context).openDrawer();
                } else {
                  navigationService.pop();
                }
              },
              child: context.isDesktop || alwaysShowHamburger
                  ? Utils.svgIconSize(
                      icMenu,
                      context.constantSize(24.c, 32.c),
                      context.constantSize(24.c, 32.c),
                color: white
                    )
                  : isHome != null && isHome!
                      ? Utils.svgIconSize(
                          icMenu,
                          context.constantSize(24.c, 32.c),
                          context.constantSize(24.c, 32.c),
                  color: white

                        )
                      : const Icon(
                          Icons.arrow_back,
                          size: 24,
                  color: white


              ),
            ),
          );
        },
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: parisViolet,
          fontWeight: bold,
          fontSize: context.fontSize(18.c, 20.0, 22.0),
        ),
      ),
    //   actions:isTrailing == null ? [] :[
    //     Padding(
    //       padding: EdgeInsets.only(
    //           right: context.constantSize(24.c, 30.c, 29.c),
    //           top: context.constantSize(10.c, 12.c, 11.c),
    //           bottom: context.constantSize(10.c, 12.c, 11.c)),
    //       child:
    //     GestureDetector(
    //         onTap: () {
    //           // navigationService.push(routeNotification);
    //         },
    //         child: Utils.svgIcon(
    //           icNotification,
    //           height: context.constantSize(24.w, 32.w),
    //           width: context.constantSize(24.w, 32.w),
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(
    //           right: context.constantSize(24.c, 30.c, 29.c),
    //           top: context.constantSize(10.c, 12.c, 11.c),
    //           bottom: context.constantSize(10.c, 12.c, 11.c)),
    //       child:
    // GestureDetector(
    //         onTap: () {
    //           navigationService.push(routeChat);
    //         },
    //         child: Utils.svgIcon(
    //           icChats,
    //           height: context.constantSize(24.w, 32.w),
    //           width: context.constantSize(24.w, 32.w),
    //         ),
    //       ),
    //     )
    //   ],

    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(contexts.constantSize(kAppBarSize, kAppBarSizeTablet));
}
