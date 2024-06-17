
import 'package:phiz_desktop/provider/app_state_provider.dart';
import 'package:phiz_desktop/utils/constants/image_constant.dart';
import 'package:phiz_desktop/utils/extensions/size_extension.dart';
import 'package:phiz_desktop/utils/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phiz_desktop/utils/preference_utils.dart';
import 'package:provider/provider.dart' as consumer;


import '../utils/color_utils.dart';
import '../utils/constants/app_constant.dart';
import '../utils/utils.dart';

class CustomWebMobileDrawer extends HookConsumerWidget {
  const CustomWebMobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // User? dtt;
    Future getData() async {
      await init();
    }
    useEffect(()  {
      getData();
    }, []);



    return consumer.Consumer<AppStateProvider>(
        builder: (context, valueProvider, child) {
      return SizedBox(
        width: !valueProvider.isWebDrawerOpen && context.isDesktop
            ? context.dynamicSize(
                Utils.getWidth(context) * 0.19,
                Utils.getWidth(context) * 0.17,
                Utils.getWidth(context) * webCloseDrawerSize,
                Utils.getWidth(context) * webCloseDrawerSize)
            : context.dynamicSize(
                Utils.getWidth(context) * 0.69,
                Utils.getWidth(context) * 0.55,
                Utils.getWidth(context) * 0.42,
                Utils.getWidth(context) * webOpenDrawerSize),
        child: Drawer(
          backgroundColor: darkPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Gap(24.c),
                InkWell(
                  onTap: () {
                    // print('rrrrr ${dtt?.roles}');
                    // navigationService.push(routeMyProfile);
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: context.isMobile ? 8.c : 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        // ProfileImageView(
                        //   imageUrl:
                        //       profileState.asData?.value?.profilePic ?? "",
                        //   size: context.constantSize(43.c),
                        // ),
                        // if (valueProvider.isWebDrawerOpen ||
                        //     !context.isDesktop)
                        //   Expanded(
                        //     child: Padding(
                        //       padding: EdgeInsets.only(left: 14.w),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             (profileState.asData?.value?.firstName ??
                        //                     "") +
                        //                 " " +
                        //                 (profileState
                        //                         .asData?.value?.lastName ??
                        //                     ""),
                        //             maxLines: 1,
                        //             overflow: TextOverflow.ellipsis,
                        //             style: TextStyle(
                        //                 fontSize: context.fontSize(18.sp),
                        //                 fontWeight: bold),
                        //           ),
                        //           // Text(
                        //           //   profileState
                        //           //           .asData?.value?.organization ??
                        //           //       "",
                        //           //   maxLines: 1,
                        //           //   overflow: TextOverflow.ellipsis,
                        //           //   style: TextStyle(
                        //           //       fontSize: context.fontSize(14.sp),
                        //           //       color: appColors.grayText),
                        //           // )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // if (!context.isDesktop)
                        //   InkWell(
                        //     onTap: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: Utils.svgIconSize(
                        //       icClose,
                        //       context.constantSize(24.c, 32.c),
                        //       context.constantSize(24.c, 32.c),
                        //     ),
                        //   )
                      ],
                    ),
                  ),
                ),
                Gap(15.c),
                valueProvider.isWebDrawerOpen
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset('assets/images/dukanCart.png',
                            height: 70))
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    DrawerTab(
                      context,
                      Icons.airplay_outlined,
                      "Add Category",
                      white,
                      darkPrimaryColor,
                      Border.all(color: Colors.transparent),
                      valueProvider.isWebDrawerOpen,
                          () {

                      },
                      svgPath: AppImages.categorySvg,
                    ),
                  ],
                )
                // userState.when(
                //   data: (data) {
                //     return getString(preUserRoles) == UserTypes.admin
                //         ?
                //     Column(
                //             children: [
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Add Category",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeAddCategory);
                //                 },
                //                 svgPath: AppImages.categorySvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Add Subcategory",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeAddSubCategory);
                //                 },
                //                 svgPath: AppImages.subCategorySvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Add varient",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeAddVariant);
                //                 },
                //                 svgPath: AppImages.varientSvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Add Product",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeAddProduct);
                //                 },
                //                 svgPath: AppImages.productSvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Users",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeAddUser);
                //                 },
                //                 svgPath: AppImages.userSvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Manage Order",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService.pushReplacement(routeOrder);
                //                 },
                //                 svgPath: AppImages.orderSvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Inquiry",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeInquiry);
                //                 },
                //                 svgPath: AppImages.orderSvg,
                //               ),
                //               DrawerTab(
                //                 context,
                //                 Icons.airplay_outlined,
                //                 "Manage User",
                //                 white,
                //                 darkPrimaryColor,
                //                 Border.all(color: Colors.transparent),
                //                 valueProvider.isWebDrawerOpen,
                //                 () {
                //                   navigationService
                //                       .pushReplacement(routeManageUser);
                //                 },
                //                 svgPath: AppImages.orderSvg,
                //               ),
                //             ],
                //           )
                //         : Column(
                //       children: [
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Add Category",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeAddCategory);
                //           },
                //           svgPath: AppImages.categorySvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Add Subcategory",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeAddSubCategory);
                //           },
                //           svgPath: AppImages.subCategorySvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Add varient",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeAddVariant);
                //           },
                //           svgPath: AppImages.varientSvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Add Product",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeAddProduct);
                //           },
                //           svgPath: AppImages.productSvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Users",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeAddUser);
                //           },
                //           svgPath: AppImages.userSvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Manage Order",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService.pushReplacement(routeOrder);
                //           },
                //           svgPath: AppImages.orderSvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Inquiry",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeInquiry);
                //           },
                //           svgPath: AppImages.orderSvg,
                //         ),
                //         DrawerTab(
                //           context,
                //           Icons.airplay_outlined,
                //           "Manage User",
                //           white,
                //           darkPrimaryColor,
                //           Border.all(color: Colors.transparent),
                //           valueProvider.isWebDrawerOpen,
                //               () {
                //             navigationService
                //                 .pushReplacement(routeManageUser);
                //           },
                //           svgPath: AppImages.orderSvg,
                //         ),
                //       ],
                //     );
                //
                //     // DrawerTab(
                //     //         context,
                //     //         Icons.airplay_outlined,
                //     //         "Order",
                //     //         white,
                //     //         darkPrimaryColor,
                //     //         Border.all(color: Colors.transparent),
                //     //         valueProvider.isWebDrawerOpen,
                //     //         () {
                //     //           // if(roles == "designer") {
                //     //           //   navigationService
                //     //           //       .pushReplacement(routeDesignerOrder);
                //     //           // }
                //     //           // else if(roles == "production") {
                //     //           //   navigationService
                //     //           //       .pushReplacement(routeProductionOrder);
                //     //           // }
                //     //           // else{
                //     //           //   navigationService
                //     //           //       .pushReplacement(routeLogin);
                //     //           // }
                //     //           getString(preUserRoles) == UserTypes.designer
                //     //               ? navigationService
                //     //                   .pushReplacement(routeDesignerOrder)
                //     //               : navigationService
                //     //                   .pushReplacement(routeProductionOrder);
                //     //         },
                //     //         svgPath: AppImages.orderSvg,
                //     //       );
                //   },
                //   loading: () => const Loading(),
                //   error: (obj, trace) => ErrorWidget(obj),
                // ),

                // DrawerTab(context,Icons.airplay_outlined,"Jama",parisViolet,white,Border.all(color: Colors.transparent),valueProvider.isWebDrawerOpen,(){navigationService.pushReplacement(routejama);}),
                // DrawerTab(context,Icons.airplay_outlined,"Report",parisViolet,white,Border.all(color: Colors.transparent),valueProvider.isWebDrawerOpen,(){navigationService.pushReplacement(routeReportScreen);}),
                // ResponsiveGridRow(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     ResponsiveGridCol(
                //       xs: 20,
                //       child: Container(
                //         margin: const EdgeInsets.all(20),
                //         child: Row(
                //           children: [
                //             const Icon(
                //               Icons.business_outlined,
                //               color: Colors.grey,
                //             ),
                //             const SizedBox(width: 10),
                //             GestureDetector(
                //               onTap: () {
                //                 navigationService.pushReplacement(routeCompany);
                //               },
                //               child: const Text(
                //                 "Company",
                //                 style:
                //                 TextStyle(color: Colors.grey, fontSize: 15),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     ResponsiveGridCol(
                //       xs: 20,
                //       child: Container(
                //         margin: const EdgeInsets.all(20),
                //         child: Row(
                //           children: [
                //             const Icon(Icons.settings_outlined,
                //                 color: Colors.grey),
                //             const SizedBox(width: 10),
                //             GestureDetector(
                //               onTap: () {
                //                 navigationService.pushReplacement(routeSetting);
                //               },
                //               child: const Text(
                //                 "Setting",
                //                 style:
                //                 TextStyle(color: Colors.grey, fontSize: 15),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     ResponsiveGridCol(
                //       xs: 20,
                //       child: Container(
                //         margin: const EdgeInsets.all(20),
                //         child: Row(
                //           children: [
                //             const Icon(Icons.dashboard_outlined,
                //                 color: Colors.grey),
                //             const SizedBox(width: 10),
                //             GestureDetector(
                //               onTap: () {
                //                 navigationService
                //                     .pushReplacement(routeCompanyShape);
                //               },
                //               child: const Text(
                //                 "shape",
                //                 style:
                //                 TextStyle(color: Colors.grey, fontSize: 15),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     ResponsiveGridCol(
                //       xs: 20,
                //       child: Container(
                //         margin: const EdgeInsets.all(20),
                //         child: Row(
                //           children: [
                //             const Icon(Icons.work_outlined, color: Colors.grey),
                //             const SizedBox(width: 10),
                //             GestureDetector(
                //               onTap: () {
                //                 navigationService
                //                     .pushReplacement(routeCreateWork);
                //               },
                //               child: const Text(
                //                 "work",
                //                 style:
                //                 TextStyle(color: Colors.grey, fontSize: 15),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     ResponsiveGridCol(
                //       xs: 20,
                //       child: Container(
                //         margin: const EdgeInsets.all(20),
                //         child: Row(
                //           children: [
                //             Icon(Icons.schema, color: Colors.grey),
                //             SizedBox(width: 10),
                //             GestureDetector(
                //               onTap: () {
                //                 navigationService.pushReplacement(routejama);
                //               },
                //               child: Text(
                //                 "Jama",
                //                 style:
                //                 TextStyle(color: Colors.grey, fontSize: 15),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     ResponsiveGridCol(
                //       xs: 20,
                //       child: Container(
                //         margin: const EdgeInsets.all(20),
                //         child: Row(
                //           children: [
                //             Icon(Icons.report_outlined, color: Colors.grey),
                //             SizedBox(width: 10),
                //             GestureDetector(
                //               onTap: () {
                //                 navigationService
                //                     .pushReplacement(routeReportScreen);
                //               },
                //               child: Text(
                //                 "Report",
                //                 style:
                //                 TextStyle(color: Colors.grey, fontSize: 15),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),,
                ,
                const Expanded(child: SizedBox()),
                // ...drawerIcems.map(
                //       (e) {
                //     return InkWell(
                //       onTap: () async {
                //         // navigationService.pop();
                //         // if (!await checkNetworkConnection(showToast: false) && e.index == 2) {
                //         //   displayToast(featureNotAvailableOffline);
                //         //   return;
                //         // }
                //         // valueProvider.changeSelectedDrawerItem(e.index);
                //         //
                //         // if (e.index != 0) {
                //         //   valueProvider.changeSelectedTab(-1);
                //         // }
                //         //
                //         // if (e.index == 0) {
                //         //   valueProvider.selectHome();
                //         //   await navigationService.pushAndRemoveUntilRoute(
                //         //       routeHome,
                //         //       lastRoute: "/");
                //         // } else if (e.index == 1) {
                //         //   await navigationService
                //         //       .pushAndRemoveUntilRoute(routeTrackApplication);
                //         //   valueProvider.selectHome();
                //         // } else if (e.index == 2) {
                //         //   await navigationService
                //         //       .pushAndRemoveUntilRoute(routeLeadManagement);
                //         //   valueProvider.selectHome();
                //         // } else if (e.index == 3) {
                //         //   await navigationService
                //         //       .pushAndRemoveUntilRoute(routeFaqs);
                //         //   valueProvider.selectHome();
                //         // }
                //       },
                //       child: DrawerTab(c
                //           context,
                //           e.image,
                //           e.name,
                //           valueProvider.selectedDrawerItem == e.index
                //               ? appColors.itemSelected
                //               : appColors.itemUnselected,
                //           valueProvider.selectedDrawerItem == e.index
                //               ? appColors.itemSelected.withOpacity(0.1)
                //               : Colors.transparent,
                //           valueProvider.selectedDrawerItem == e.index
                //               ? Border(
                //             left: BorderSide(
                //                 width: 3,
                //                 color: appColors.itemSelected),
                //           )
                //               : Border.all(
                //             color: Colors.transparent,
                //           ),
                //           valueProvider.isWebDrawerOpen),
                //     );
                //   },
                // ),
                const Spacer(),
                DrawerTab(
                  context,
                  Icons.logout,
                  "LOGOUT",
                  white,
                  darkPrimaryColor,
                  Border.all(color: Colors.transparent),
                  valueProvider.isWebDrawerOpen,
                      () {
                    clear();

                  },
                  svgPath: AppImages.logoutSvg,
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                // InkWell(
                //   onTap: () {
                //     if (kIsWeb || context.isTablet) {
                //       showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return const Logout();
                //         },
                //       );
                //     } else {
                //       showModalBottomSheet(
                //           context: context,
                //           backgroundColor: white,
                //           builder: (context) {
                //             return const Logout();
                //           });
                //     }
                //   },
                //   child: DrawerTab(
                //       context,
                //       icLogout,
                //       logOut,
                //       appColors.itemUnselected,
                //       Colors.transparent,
                //       null,
                //       valueProvider.isWebDrawerOpen),
                // ),
                Gap(10.c)
              ],
            ),
          ),
        ),
      );
    });
  }
}

class DrawerTab extends StatelessWidget {
  const DrawerTab(this.context, this.imgpath, this.tabtitle, this.color,
      this.bgcolor, this.border, this.isOpen, this.onTap,
      {Key? key, required this.svgPath})
      : super(key: key);
  final BuildContext context;
  final IconData imgpath;
  final String tabtitle;
  final String svgPath;
  final Color color;
  final Color bgcolor;
  final Border? border;
  final void Function()? onTap;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 11, bottom: 10, left: 12),
        decoration: BoxDecoration(
          color: bgcolor,
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Utils.svgIconColor(svgPath, 20, 20, Colors.white),
            // Utils.svgIconColor(svgPath,height: 20,width: 20,),
            Utils.svgIconColor(svgPath,20,20,Colors.white),
            // Icon(
            //   imgpath,
            //   size: 24,
            //   color: white,
            // ),
            if (isOpen || !context.isDesktop)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: !context.isDesktop
                          ? Utils.getWidth(context) * 0.03
                          : 14.0),
                  child: Text(
                    tabtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color,
                      fontSize: context.fontSize(16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
