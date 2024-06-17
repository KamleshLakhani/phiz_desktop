import 'package:flutter/material.dart';
import 'package:phiz_desktop/widgets/function_widgets.dart';
import '../utils/color_utils.dart';
import '../utils/extensions/size_extension.dart';
import 'custom_web_mobile_appbar.dart';
import 'custom_web_mobile_drawer.dart';

class CustomWebScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool hasIcon;
  final bool isHome;
  final ValueNotifier<bool>? isLoading;
  final bool isTableNeedSpace;
  // final BuildContext? contexts;

  const CustomWebScaffold({
    Key? key,
    required this.child,
    required this.title,
    this.hasIcon = true,
    this.isHome = false,
    this.isLoading,
    this.isTableNeedSpace = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          color: darkPrimaryColor,
          contexts: context,
          title: context.isDesktop ? '' : title,
          isHome: isHome,
        ),
        // appBar: AppBar(
        //   foregroundColor: Colors.black,
        // ),
        drawer: const CustomWebMobileDrawer(),
        // Drawer(
        //   child: Container(
        //     alignment: Alignment.topLeft,
        //     width: 300,
        //     decoration: const BoxDecoration(
        //       border: Border(
        //         right: BorderSide(width: 2, color: Colors.grey),
        //       ),
        //       color: Colors.white,
        //     ),
        //     child: Column(
        //       children: [
        //         const SizedBox(height: 50),
        //         ResponsiveGridRow(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             ResponsiveGridCol(
        //               xs: 20,
        //               child: Container(
        //                 margin: const EdgeInsets.all(20),
        //                 child: Row(
        //                   children: [
        //                     const Icon(
        //                       Icons.business_outlined,
        //                       color: Colors.grey,
        //                     ),
        //                     const SizedBox(width: 10),
        //                     GestureDetector(
        //                       onTap: () {
        //                         navigationService.pushReplacement(routeCompany);
        //                       },
        //                       child: const Text(
        //                         "Company",
        //                         style:
        //                             TextStyle(color: Colors.grey, fontSize: 15),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             ResponsiveGridCol(
        //               xs: 20,
        //               child: Container(
        //                 margin: const EdgeInsets.all(20),
        //                 child: Row(
        //                   children: [
        //                     const Icon(Icons.settings_outlined,
        //                         color: Colors.grey),
        //                     const SizedBox(width: 10),
        //                     GestureDetector(
        //                       onTap: () {
        //                         navigationService.pushReplacement(routeSetting);
        //                       },
        //                       child: const Text(
        //                         "Setting",
        //                         style:
        //                             TextStyle(color: Colors.grey, fontSize: 15),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             ResponsiveGridCol(
        //               xs: 20,
        //               child: Container(
        //                 margin: const EdgeInsets.all(20),
        //                 child: Row(
        //                   children: [
        //                     const Icon(Icons.dashboard_outlined,
        //                         color: Colors.grey),
        //                     const SizedBox(width: 10),
        //                     GestureDetector(
        //                       onTap: () {
        //                         navigationService
        //                             .pushReplacement(routeCompanyShape);
        //                       },
        //                       child: const Text(
        //                         "shape",
        //                         style:
        //                             TextStyle(color: Colors.grey, fontSize: 15),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             ResponsiveGridCol(
        //               xs: 20,
        //               child: Container(
        //                 margin: const EdgeInsets.all(20),
        //                 child: Row(
        //                   children: [
        //                     const Icon(Icons.work_outlined, color: Colors.grey),
        //                     const SizedBox(width: 10),
        //                     GestureDetector(
        //                       onTap: () {
        //                         navigationService
        //                             .pushReplacement(routeCreateWork);
        //                       },
        //                       child: const Text(
        //                         "work",
        //                         style:
        //                             TextStyle(color: Colors.grey, fontSize: 15),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             ResponsiveGridCol(
        //               xs: 20,
        //               child: Container(
        //                 margin: const EdgeInsets.all(20),
        //                 child: Row(
        //                   children: [
        //                     Icon(Icons.schema, color: Colors.grey),
        //                     SizedBox(width: 10),
        //                     GestureDetector(
        //                       onTap: () {
        //                         navigationService.pushReplacement(routejama);
        //                       },
        //                       child: Text(
        //                         "Jama",
        //                         style:
        //                             TextStyle(color: Colors.grey, fontSize: 15),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             ResponsiveGridCol(
        //               xs: 20,
        //               child: Container(
        //                 margin: const EdgeInsets.all(20),
        //                 child: Row(
        //                   children: const [
        //                     Icon(Icons.report_outlined, color: Colors.grey),
        //                     SizedBox(width: 10),
        //                     Text(
        //                       "Report",
        //                       style:
        //                           TextStyle(color: Colors.grey, fontSize: 15),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         const Expanded(child: SizedBox()),
        //         const Divider(thickness: 2),
        //         Container(
        //           margin: const EdgeInsets.all(15),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               IconButton(
        //                 icon: const Icon(
        //                   Icons.logout,
        //                   size: 18,
        //                 ),
        //                 color: Colors.grey,
        //                 onPressed: () {},
        //               ),
        //               const Text(
        //                 "Logout",
        //                 style: TextStyle(color: Colors.grey, fontSize: 20),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // bottomNavigationBar:
        //     !context.isDesktop ? const CustomBottomNavigationBar() : null,
        body: Stack(
          children: [
            context.isMobile
                ? Column(
                    children: [
                      Expanded(child: child),
                    ],
                  )
                : Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (context.isDesktop || isTableNeedSpace)
                            getWebLeftEmptyWidget(context),
                          Expanded(
                            child: Column(
                              children: [
                                // if (context.isDesktop)
                                //   WebBackBar(
                                //     hasIcon: hasIcon,
                                //     title: title,
                                //   ),
                                Expanded(child: child)
                              ],
                            ),
                          ),
                          if (context.isDesktop || isTableNeedSpace)
                            getWebRightEmptyWidget(context),
                        ],
                      ),
                      if (context.isDesktop) const CustomWebMobileDrawer()
                    ],
                  ),

            // ValueListenableBuilder(
            //   builder: (BuildContext context, bool value, Widget? child) {
            //     return value ? const Loading() : const SizedBox();
            //   },
            //   valueListenable: isLoading ?? ValueNotifier(false),
            // )
          ],
        ));
  }
}
