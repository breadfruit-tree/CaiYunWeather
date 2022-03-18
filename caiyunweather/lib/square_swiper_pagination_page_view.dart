// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
//
// class SquareSwiperPaginationBuilder extends SwiperPlugin {
//   ///color when current index,if set null , will be Theme.of(context).primaryColor
//   final Color activeColor;
//
//   ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
//   final Color color;
//
//   ///Size of the dot when activate
//   final double activeSize;
//
//   ///Size of the dot
//   final double size;
//
//   /// Space between dots
//   final double space;
//
//   ///加了一个自定义高度的参数，如果要使用Size.height 的话需要修改size的类型（double->Size）,这样的话也需要重新写PageIndicator，过犹不及了。
//   ///Height of the dots
//   final double height;
//
//   final Key key;
//
//   const SquareSwiperPaginationBuilder(
//       {this.activeColor =Colors.blue,
//       this.color =Colors.white,
//       this.key,
//       this.height = 4.0,
//       this.size = 4.0,
//       this.activeSize = 10.0,
//       this.space = 3.0});
//
//   @override
//   Widget build(BuildContext context, SwiperPluginConfig config) {
//     if (config.itemCount > 20) {
//       if (kDebugMode) {
//         print(
//           "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
//       }
//     }
//     Color activeColor = this.activeColor;
//     Color color = this.color;
//
//     if (activeColor == null || color == null) {
//       ThemeData themeData = Theme.of(context);
//       activeColor = this.activeColor ?? themeData.primaryColor;
//       color = this.color ?? themeData.scaffoldBackgroundColor;
//     }
//
//     if (config.indicatorLayout != PageIndicatorLayout.NONE &&
//         config.layout == SwiperLayout.DEFAULT) {
//       return PageIndicator(
//         count: config.itemCount,
//         controller: config.pageController,
//         layout: config.indicatorLayout,
//         size: size,
//         activeColor: activeColor,
//         color: color,
//         space: space,
//       );
//     }
//
//     List<Widget> list = [];
//
//     int itemCount = config.itemCount;
//     int activeIndex = config.activeIndex;
//
//     for (int i = 0; i < itemCount; ++i) {
//       bool active = i == activeIndex;
//       list.add(Container(
//         key: Key("pagination_$i"),
//         margin: EdgeInsets.all(space),
//         child: active
//             ? SizedBox(
//                 width: activeSize,
//                 height: height,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(Radius.circular(height / 2)),
//                       color: activeColor),
//                 ),
//               )
//             : SizedBox(
//                 width: size,
//                 height: height,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(Radius.circular(height / 2)),
//                       color: color),
//                 ),
//               ),
//       ));
//     }
//
//     if (config.scrollDirection == Axis.vertical) {
//       return  Column(
//         key: key,
//         mainAxisSize: MainAxisSize.min,
//         children: list,
//       );
//     } else {
//       return  Row(
//         key: key,
//         mainAxisSize: MainAxisSize.min,
//         children: list,
//       );
//     }
//   }
// }
//
// typedef SwiperPaginationBuilder = Widget Function(
//     BuildContext context, SwiperPluginConfig config);
//
// class SwiperCustomPagination extends SwiperPlugin {
//   final SwiperPaginationBuilder builder;
//
//   SwiperCustomPagination({required this.builder});
//
//   @override
//   Widget build(BuildContext context, SwiperPluginConfig config) {
//     return builder(context, config);
//   }
// }
//
// class SquareSwiperPagination extends SwiperPlugin {
//   static const SwiperPlugin square =  SquareSwiperPaginationBuilder();
//
//   /// Alignment.bottomCenter by default when scrollDirection== Axis.horizontal
//   /// Alignment.centerRight by default when scrollDirection== Axis.vertical
//   final Alignment alignment;
//
//   /// Distance between pagination and the container
//   final EdgeInsetsGeometry margin;
//
//   /// Build the widet
//   final SwiperPlugin builder;
//
//   final Key key;
//   UniqueKey paginationkey = UniqueKey();
//
//    SquareSwiperPagination(
//       {this.alignment =Alignment.bottomCenter,
//       this.key:paginationkey,
//       this.margin = const EdgeInsets.all(10.0),
//       this.builder = SquareSwiperPagination.square});
//
//   @override
//   Widget build(BuildContext context, SwiperPluginConfig config) {
//     Alignment alignment = Alignment.bottomCenter;
//     Widget child = Container(
//       margin: margin,
//       child: builder.build(context, config),
//     );
//
//     ///拿掉这个判断之后，使得指示器无论在轮播图之上还是下面都可以居中
//     // if (!config.outer) {
//     child = Align(
//       key: key,
//       alignment: alignment,
//       child: child,
//     );
//     // }
//     return child;
//   }
// }
