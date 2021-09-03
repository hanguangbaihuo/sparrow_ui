import 'package:sparrow_ui/sparrow_ui.dart';
import 'list_item.dart';
import 'list_item_divider.dart';

class SPListItemGroup extends StatelessWidget {
  final List<SPListItem> items;
  const SPListItemGroup({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
      separatorBuilder: (context, index) => SPListItemDivider(),
    );
  }
}
