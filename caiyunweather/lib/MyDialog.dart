import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog extends Dialog {
  String title;

  MyDialog({Key? key, this.title = ""}) : super(key: key);

  var weatherList = [
    {
      "image": "images/skyicon_sunshine.png",
      "title": "晴朗",
    },
    {
      "image": "images/skyicon_cloud.png",
      "title": "阴",
    },
    {
      "image": "images/skyicon_rain_light.png",
      "title": "小雨",
    },
    {
      "image": "images/skyicon_rain_normal.png",
      "title": "大雨",
    },
    {
      "image": "images/skyicon_snow.png",
      "title": "雪",
    },
    {
      "image": "images/skyicon_haze_heavy.png",
      "title": "雾霾",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      //透明度
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          height: 340,
          width: Get.width - 30,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: GridView.builder(
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
                        childAspectRatio: (Get.width / 3) / 120),
                    itemBuilder: (context, index) {
                      return weatherItem(
                        weatherList[index]["image"],
                        weatherList[index]["title"],
                      );
                    },
                    itemCount: weatherList.length,
                  ),
                ),
                const Divider(
                  height: 0.5,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: InkWell(
                      child: SizedBox(
                        height: 45,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              "取消",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )),
                    Container(
                      color: Colors.grey.withOpacity(0.5),
                      width: 0.5,
                      height: 50,
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 45,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "确定",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///分享item
  Widget weatherItem(var imgUrl, var title) => SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: ClipOval(
                    child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipOval(
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.fill,
                        scale: 2,
                      ),
                    ),
                  ),
                  color: Colors.white,
                )),
              ),
              margin: const EdgeInsets.all(5),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      );
}
