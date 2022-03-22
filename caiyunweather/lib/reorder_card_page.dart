import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';

class ReorderCardPageView extends StatefulWidget {
  const ReorderCardPageView({Key? key}) : super(key: key);

  @override
  _ReorderCardPageViewState createState() => _ReorderCardPageViewState();
}

class _ReorderCardPageViewState extends State<ReorderCardPageView> {
  void _handlerReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    setState(() {
      final element = reorderList.removeAt(oldIndex);
      reorderList.insert(newIndex, element);
    });
  }

  void _handlerDelete(int index, bool hasInserted) {
    setState(() {
      if (hasInserted) {
        final element = reorderList.removeAt(index);
        unInsertList.add(element);
      } else {
        final element = unInsertList.removeAt(index);
        reorderList.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebedf0),
      appBar: AppBar(
        elevation: 0,
        title: const Text("卡片排序"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: reorderList.length * 65 + 40,
              margin: const EdgeInsets.all(12),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey.withOpacity(0.2)),
                child: ReorderableListView(
                  children: _reOrderList(true),

                  physics: const NeverScrollableScrollPhysics(),

                  ///调换时回调
                  onReorder: _handlerReorder,
                  padding: const EdgeInsets.all(12),

                  ///头部组件
                  header: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "已添加卡片",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "首页的天气卡片将会按照以下的顺序展示",
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "未添加卡片",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "新添加的天气卡片将会展示在末位",
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: unInsertList.isNotEmpty,
                        replacement: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.map,
                                color: Colors.grey.withOpacity(0.6),
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("当前没有未添加卡片",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.9),
                                      fontSize: 13))
                            ],
                          ),
                        ),
                        child: SizedBox(
                          height: unInsertList.length * 65,
                          child: ReorderableListView(
                            children: _reOrderList(false),

                            physics: const NeverScrollableScrollPhysics(),

                            ///调换时回调
                            onReorder: _handlerReorder,
                            padding: const EdgeInsets.all(12),
                            header: const SizedBox(),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _reOrderList(bool boolean) {
    List<Widget> listWidget = [];
    if (boolean) {
      for (var i = 0; i < reorderList.length; i++) {
        listWidget.add(_buildReOrderItem1(i, boolean));
      }
    } else {
      for (var i = 0; i < unInsertList.length; i++) {
        listWidget.add(_buildReOrderItem1(i, boolean));
      }
    }
    return listWidget;
  }

  Widget _buildReOrderItem1(int i, hasInserted) {
    var list = hasInserted ? reorderList : unInsertList;
    var isSelected = list[i]["isSelected"];
    var title = list[i]["title"];
    var ps = list[i]["ps"];
    return Container(
      key: ValueKey(i),
      height: 50,
      width: Get.width - 30,
      margin: const EdgeInsets.only(bottom: 12),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: Row(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Visibility(
                  visible: hasInserted,
                  child: Icon(
                    isSelected ? Icons.circle : Icons.cancel,
                    color:
                        isSelected ? Colors.grey.withOpacity(0.4) : Colors.red,
                    size: 20,
                  ),
                  replacement: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ),
              onTap: () => !isSelected ? _handlerDelete(i, hasInserted) : null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Visibility(child: Text(
                  ps.toString(),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.9),
                      fontSize: 11),
                ),replacement: const SizedBox(),visible: ps!="",),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.reorder,
              color: Colors.grey.withOpacity(0.6),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }

  ///一样可以实现效果，但是获取不到index，弃用了
// Widget _buildReOrderItem(Map map) => Container(
//       key: ValueKey(map),
//       height: 50,
//       width: Get.width - 30,
//       margin: const EdgeInsets.only(bottom: 12),
//       child: DecoratedBox(
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             color: Colors.white),
//         child: Row(
//           children: [
//             InkWell(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Icon(
//                   map["isSelected"] == true ? Icons.circle : Icons.cancel,
//                   color: map["isSelected"] == true
//                       ? Colors.grey.withOpacity(0.4)
//                       : Colors.red,
//                   size: 20,
//                 ),
//               ),
//               onTap: () => _handlerDelete,
//             ),
//             Text(
//               map["title"],
//               style: const TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             const Spacer(),
//             Icon(
//               Icons.reorder,
//               color: Colors.grey.withOpacity(0.6),
//             ),
//             const SizedBox(
//               width: 15,
//             )
//           ],
//         ),
//       ),
//     );
}
