import 'dart:io';

import 'package:caiyunweather/SelfCustomPaginationBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import 'MyDialog.dart';
import 'constant.dart';
import 'life_index_make.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.blue);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //去掉debug右上角标志
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UniqueKey paginationKey = UniqueKey();


  final int EVERY_PAGE_ITEM_COUNT = 4;

  late int page;

  ///处理带指示器导航栏数据时候展示用的list
  List<Map<String, dynamic>> showList = [];

  @override
  Widget build(BuildContext context) {
    page = lifeList.length % EVERY_PAGE_ITEM_COUNT == 0
        ? (lifeList.length ~/ EVERY_PAGE_ITEM_COUNT)
        : (lifeList.length ~/ EVERY_PAGE_ITEM_COUNT + 1);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: Get.height - 280,
                  child: Stack(
                    children: [
                      // Container(
                      //   color: ,
                      // )
                      Image.asset(
                        "images/weatherbg_sunshine_new.jpg",
                        scale: 2,
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: SizedBox(
                              height: 25,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3)),
                                    color: Colors.black.withOpacity(0.4)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Image.asset(
                                      "images/notification_pm_excellent_color.png",
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "24 优",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 12),
                            child: SizedBox(
                              height: 25,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3)),
                                    color: Colors.black.withOpacity(0.3)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Image.asset(
                                      "images/alert_cold_blue_is.png",
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "寒潮蓝色预警",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "5°",
                                    style: TextStyle(
                                        fontSize: 60, color: Colors.white),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 150, top: 35),
                                    child: InkWell(
                                      child: SizedBox(
                                        height: 24,
                                        child: DecoratedBox(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: Colors.white24),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  "images/icon_feedback.png",
                                                  scale: 2,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text(
                                                    "反馈天气",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () => showDialog(
                                          context: context,
                                          builder: (context) =>
                                              MyDialog(title: "我要反馈天气")),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "多云",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  var image = weatherStatus[index]["image"];
                                  var title = weatherStatus[index]["title"];
                                  var tag = weatherStatus[index]["tag"];
                                  return SizedBox(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          image!,
                                          scale: 2,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            title!,
                                            style: const TextStyle(
                                                color: Colors.white54),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          tag!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) => const Divider(
                                      height: 0.5,
                                      color: Colors.white,
                                    ),
                                itemCount: weatherStatus.length),
                          ),
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 30, 15, 40),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                            color: Colors.white12),
                                        child: Image.asset(
                                          "images/push_icon_aqi.png",
                                          scale: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    "images/map.png",
                                    scale: 4,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 40,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/horn.png",
                                      scale: 4,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("最近的降雪带在150公里外呢"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 110,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("今明气温变化不大"),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 65,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  var image = weatherReportList[index]["image"];
                                  var title = weatherReportList[index]["title"];
                                  var tag = weatherReportList[index]["tag"];
                                  var tamp = weatherReportList[index]["temp"];

                                  return SizedBox(
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          image!,
                                          scale: 3,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(title!),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: tag == "轻度"
                                                              ? Colors.orange
                                                              : Colors.green,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    3))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 3),
                                                      child: Text(tag!),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Text(tamp!)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return Container(
                                    height: 50,
                                    color: Colors.grey.withOpacity(0.3),
                                    width: 0.5,
                                  );
                                },
                                itemCount: weatherReportList.length),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 210,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              children: [
                                const Text(
                                  "生活指数",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => Get.to(
                                      () => const LifeIndexMakePageView()),
                                  child: const Text(
                                    "编辑",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.green),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 160,
                            child: Swiper(
                              key: paginationKey,
                              autoplay: true,

                              ///控制指示器位于分页下面还是页面内
                              outer: false,
                              itemCount: page,
                              itemBuilder:
                                  (BuildContext context, int pageIndex) {
                                showList.clear();
                                if (pageIndex >= page) {
                                  return const Text("adasd");
                                }
                                for (var i = 0; i < page; i++) {
                                  if (pageIndex == i) {
                                    showList = lifeList
                                        .getRange(i * EVERY_PAGE_ITEM_COUNT,
                                            (i + 1) * EVERY_PAGE_ITEM_COUNT)
                                        .toList();
                                  }
                                }
                                return GridView.builder(
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(

                                          ///横轴元素个数
                                          crossAxisCount: 2,

                                          ///子组件宽高比
                                          childAspectRatio:
                                              (Get.width / 2) / 80),
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          showList[index]["image"],
                                          scale: 3,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(showList[index]["title"]),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(showList[index]["tag"]),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: showList.length,
                                );
                              },
                              pagination: const SelfCustomPagination(
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.only(bottom: 0),
                                  builder: SelfCustomPaginationBuilder(
                                      color: Color(0xff8993AB),
                                      activeColor: Colors.green,
                                      size: 4,
                                      activeSize: 14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 44,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "山东省  临沂市",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 14,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => showShareDialog(),
                    child: const Icon(
                      Icons.ios_share,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  InkWell(
                    onTap: () => print("点击 用户中心"),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  ///分享底部dialog
  showShareDialog() => showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return SizedBox(
          height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                    ///横轴元素个数
                    crossAxisCount: 3,

                    ///纵轴间距
                    mainAxisSpacing: 0.0,

                    ///横轴间距
                    crossAxisSpacing: 0.0,

                    ///子组件宽高比
                    childAspectRatio: (Get.width / 3) / 110),
                itemBuilder: (context, index) {
                  return shareItem(
                    shareList[index]["image"],
                    shareList[index]["title"],
                  );
                },
                itemCount: shareList.length,
              ),
              InkWell(
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        );
      });

  ///分享item
  Widget shareItem(var imgUrl, var title) => SizedBox(
        height: 80,
        child: InkWell(
          splashColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imgUrl,
                scale: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          onTap: () {
            Navigator.pop(context);
            EasyLoading.showToast("分享到" + title);
          },
        ),
      );
}
