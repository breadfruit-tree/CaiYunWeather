import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';

class LifeIndexMakePageView extends StatefulWidget {
  const LifeIndexMakePageView({Key? key}) : super(key: key);

  @override
  _LifeIndexMakePageViewState createState() => _LifeIndexMakePageViewState();
}

class _LifeIndexMakePageViewState extends State<LifeIndexMakePageView> {
  ///当前正在拖拽的index
  int draggingIndex = 0;

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
              itemCount: lifeList.length,
              itemBuilder: (BuildContext context, int index) {
                var img = lifeList[index]["image"];
                var title = lifeList[index]["title"];
                return LongPressDraggable(
                  data: index,
                  ///当子child和feedback为同一个Widget时，可以设为false配合GlobalKey确保是同一个Widget 减少绘制
                  // ignoringFeedbackSemantics: false,
                  child: DragTarget<int>(
                    //松手时 如果onWillAccept返回true 那么久会调用
                    onAccept: (data) {
                      setState(() {
                        final temp = lifeList[data];
                        lifeList.remove(temp);
                        lifeList.insert(index, temp);
                      });
                    },
                    //手指拖着一个widget从另一个widget头上滑走时会调用
                    onLeave: (data) {
                      print('$data is Leaving item $index');
                    },
                    //接下来松手 是否需要将数据给这个widget？  因为需要在拖动时改变UI，所以在这里直接修改数据源
                    onWillAccept: (data) {
                      setState(() {
                        draggingIndex = index;
                      });
                      print('$index will accept item $data');
                      return true;
                    },
                    builder: (context, data, rejects) => Container(
                      margin: const EdgeInsets.all(1),
                      ///配合上面LongPressDraggable 的ignoringFeedbackSemantics属性的
                      // key: GlobalKey(),
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: const Color(0xffebedf0),
                                        width: 1)),
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
                    ),
                  ),
                  onDragStarted: () {
                    //开始拖动，备份数据源
                    setState(() {
                      draggingIndex = index;
                    });
                    print(
                        'item $index ---------------------------onDragStarted');
                  },
                  onDraggableCanceled: (Velocity velocity, Offset offset) {
                    print(
                        'item $index ---------------------------onDraggableCanceled,velocity = $velocity,offset = $offset');
                    //拖动取消，还原数据源
                  },
                  onDragCompleted: () {
                    //拖动完成，刷新状态，重置willAcceptIndex
                    print(
                        "item $index ---------------------------onDragCompleted");
                  },
                  //用户拖动item时，那个给用户看起来被拖动的widget，（就是会跟着用户走的那个widget）
                  feedback: holderItem(
                    draggingIndex,
                    lifeList[index]["image"],
                    lifeList[index]["title"],
                  ),
                  //这个是当item被拖动时，item原来位置用来占位的widget，（用户把item拖走后原来的地方该显示啥？就是这个）
                  childWhenDragging: holderItem(-1, "", ""),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  ///这里有一个问题，之前是根据index取数据展示，但是一直会遇到展示的问题（具体表现为：第一次拖动展示的是list的第0个，第二次拖动展示的是上一次拖动的）
  ///后期没解决这个问题，改为直接传输需要展示的内容
  Widget holderItem(int index, var img, var title) {
    ///必须加Material，不然拖动的字体下面会有下划线
    return Material(
      child: Container(
        width: (Get.width - 30) / 4,
        height: 80,
        margin: const EdgeInsets.all(1),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.white),
          child: index == -1
              ? const SizedBox()
              : Column(
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
                          img,
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
                      title,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
