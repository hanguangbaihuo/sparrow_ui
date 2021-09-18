import 'package:app/common.dart';
import 'dart:math';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // title: Text('Sliver Demo'),
            pinned: true, // 固定
            floating: true, // 与列表分离
            snap: true, // 不允许在中间停留，关闭或打开
            expandedHeight: 300,
            // stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text('Sliver Demo'),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverToBoxAdapter(
            child: FlutterLogo(
              size: 300,
            ),
          ),

          // 定义sliver，每一个sliver占满当前视窗
          SliverFillViewport(
            delegate: SliverChildListDelegate([
              Container(color: Colors.black),
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ]),
          ),

          // 所有widget的大小固定设置
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[Random().nextInt(999) % 18],
                );
              },
              childCount: 5,
            ),
          ),

          // 所有元素的大小，依照原型widget的大小设置
          SliverPrototypeExtentList(
            prototypeItem: Text("Hello Sliver"),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: Text("Hello Sliver!!!!!"),
                  color: Colors.primaries[Random().nextInt(999) % 18],
                );
              },
              childCount: 5,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % 18],
                );
              },
              childCount: 20,
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % 18],
                );
              },
              childCount: 10,
            ),
          ),

          // SliverLayoutBuilder

          // 填满剩余空间
          SliverFillRemaining(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
