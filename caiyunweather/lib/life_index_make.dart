import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:get/get.dart';

import 'constant.dart';

class LifeIndexMakePageView extends StatefulWidget {
  const LifeIndexMakePageView({Key? key}) : super(key: key);

  @override
  _LifeIndexMakePageViewState createState() => _LifeIndexMakePageViewState();
}

class _LifeIndexMakePageViewState extends State<LifeIndexMakePageView>  with DragFeedback, DragPlaceHolder, DragCompletion{

  List<DraggableGridItem> listOfDraggableGridItem = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < lifeList.length; i++) {
      listOfDraggableGridItem.add(DraggableGridItem(
          child: _gridCell(lifeList[i]["image"], lifeList[i]["title"]),
          isDraggable: true));
    }

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
            child: DraggableGridViewBuilder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                ///横轴元素个数
                  crossAxisCount: 4,

                  ///子组件宽高比
                  childAspectRatio: (Get.width / 4) / 80),
              children: listOfDraggableGridItem,
              dragCompletion: this,
              isOnlyLongPress: false,
              dragFeedback: this,
              dragPlaceHolder: this,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget feedback(List<DraggableGridItem> list, int index) {

    return Container(
      child: list[index].child,
      width: (Get.width-30)/4,
      height: 80,
      color: Colors.blue,
    );
  }

  @override
  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        width: (Get.width-30)/4,
        height: 80,
        color: Colors.red,
        child: list[index].child,
      ),
    );
  }


  Widget _gridCell(var img, var title) => Container(
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
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border:
                  Border.all(color: const Color(0xffebedf0), width: 1)),
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

  @override
  void onDragAccept(List<DraggableGridItem> list) {
  }
}



