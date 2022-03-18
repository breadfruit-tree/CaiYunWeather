import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import 'MyDialog.dart';

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
    return MaterialApp(
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
  var shareList = [
    {
      "image": "images/ssdk_oks_classic_qq.png",
      "title": "QQ",
    },
    {
      "image": "images/ssdk_oks_classic_qzone.png",
      "title": "QQ空间",
    },
    {
      "image": "images/ssdk_oks_classic_sinaweibo.png",
      "title": "微博",
    },
    {
      "image": "images/ssdk_oks_classic_wechat.png",
      "title": "微信",
    },
    {
      "image": "images/ssdk_oks_classic_wechatmoments.png",
      "title": "朋友圈",
    },
  ];
  var weatherStatus = [
    {"image": "images/map_layer_temp.png", "title": "体感", "tag": "-2°"},
    {"image": "images/icon_windpower.png", "title": "风", "tag": "北风3级"},
    {"image": "images/push_icon_humidity.png", "title": "湿度", "tag": "65%"},
  ];
  var weatherReportList = [
    {
      "image": "images/skyicon_partly_cloud_widget.png",
      "title": "昨天",
      "temp": "3°~20°",
      "tag": "轻度"
    },
    {
      "image": "images/skyicon_partly_cloud_night_widget.png",
      "title": "今天",
      "temp": "2°~7°",
      "tag": "良"
    },
    {
      "image": "images/skyicon_cloud.png",
      "title": "明天",
      "temp": "1°-8°",
      "tag": "优秀"
    },
  ];
  var lifeList = [
    {
      "image": "images/life_index_airconditioner.png",
      "title": "空调",
      "tag": "适合"
    },
    {"image": "images/life_index_allergy.png", "title": "过敏", "tag": "不适合"},
    {"image": "images/life_index_angling.png", "title": "垂钓", "tag": "适合"},
    {"image": "images/life_index_dating.png", "title": "约会", "tag": "不适合"},
    {"image": "images/life_index_drink.png", "title": "啤酒", "tag": "适合"},
    {"image": "images/life_index_drying.png", "title": "晾晒", "tag": "不适合"},
    {"image": "images/life_index_heatstrole.png", "title": "中暑", "tag": "适合"},
    {"image": "images/life_index_limit.png", "title": "限行", "tag": "不适合"},
    {"image": "images/life_index_rain_gear.png", "title": "雨具", "tag": "适合"},
    {
      "image": "images/life_index_road_condition.png",
      "title": "路况",
      "tag": "不适合"
    },
    {"image": "images/life_index_sport.png", "title": "运动", "tag": "不适合"},
    {"image": "images/life_index_travel.png", "title": "旅游", "tag": "不适合"},
  ];

  @override
  Widget build(BuildContext context) {
    var page =
        lifeList.length % 4 > 1 ? lifeList.length % 4 : lifeList.length ~/ 4 + 1;
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
                    height: 250,
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
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            child: Text(
                              "生活指数",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Swiper(
                              key: paginationKey,
                              autoplay: true,

                              ///控制指示器位于分页下面还是页面内
                              outer: false,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(

                                            ///横轴元素个数
                                            crossAxisCount: 4,

                                            ///子组件宽高比
                                            childAspectRatio:
                                                (Get.width / 4) / 110),
                                    itemBuilder: (context, index) {
                                      return Text("asdadsa");
                                    },
                                    itemCount: lifeList.length,
                                  ),
                                );
                              },
                              pagination: const DotSwiperPaginationBuilder(),
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
