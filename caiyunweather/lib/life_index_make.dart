import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';

class LifeIndexMakePageView extends StatelessWidget {
  const LifeIndexMakePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebedf0),
      appBar: AppBar(
        elevation: 0,
        title: const Text("生活指数编辑"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: InkWell(
              child: Text("恢复默认"),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "显示指数",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "长按拖动修改排序",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            height: 500,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                  ///横轴元素个数
                  crossAxisCount: 4,

                  ///子组件宽高比
                  childAspectRatio: (Get.width / 4) / 80),
              itemBuilder: (context, index) {
                var img = lifeList[index]["image"];
                var title = lifeList[index]["title"];
                return Container(
                  margin: const EdgeInsets.all(1),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                    color: const Color(0xffebedf0), width: 1)),
                            child: Image.asset(
                              img!,
                              scale: 3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 30,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          title!,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: lifeList.length,
            ),
          )
        ],
      ),
    );
  }
}
