import 'package:app/common.dart';
import 'package:app/pages/buttons/buttons_page.dart';
import 'package:app/pages/entitys/app_menu_entity.dart';
import 'package:app/pages/inputs/inputs_page.dart';
import 'package:app/pages/sliver_demo/sliver_demo.dart';

import 'app_menu_widget.dart';

class AppMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppMenuPageState();
}

class _AppMenuPageState extends State<AppMenuPage> with AppMenuWidget {
  List<AppMenuEntity> sourceList = [];
  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    sourceList.clear();
    AppMenuEntity appMenu = AppMenuEntity(id: 1, section: "Buttons");
    sourceList.add(appMenu);
    appMenu = AppMenuEntity(id: 2, section: "TextFiled");
    sourceList.add(appMenu);
    appMenu = AppMenuEntity(id: 3, section: "sliver");
    sourceList.add(appMenu);
    _refresh();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTap(int? id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return routes(id);
      }),
    );
  }

  Widget routes(int? id) {
    switch (id) {
      case 1:
        return ButtonsPage();
      case 2:
        return InputPage();
      case 3:
        return SliverDemo();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppMenu"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          AppMenuEntity appMenu = sourceList[index];
          return renderItemView(context, appMenu, _onTap);
        },
        itemCount: sourceList.length,
      ),
    );
  }
}
