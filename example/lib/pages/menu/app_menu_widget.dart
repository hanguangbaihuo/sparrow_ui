import 'package:app/common.dart';
import 'package:app/pages/entitys/app_menu_entity.dart';

class AppMenuWidget {
  Widget renderItemView(
      BuildContext context, AppMenuEntity? appMenu, Function(int? id) tap) {
    return InkWell(
      onTap: () {
        tap(appMenu?.id);
      },
      child: Container(
        padding: EdgeInsets.only(
            left: 15.rpx, top: 15.rpx, bottom: 15.rpx, right: 15.rpx),
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              color: PIColors.gray[3]!,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "${appMenu?.section}",
                style: TextStyle(
                  color: PIColors.gray[10],
                  fontSize: 28.rpx,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: PIColors.gray[4],
            )
          ],
        ),
      ),
    );
  }
}
