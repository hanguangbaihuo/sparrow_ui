import 'package:app/common.dart';
import 'package:sparrow_ui/widgets/textfield/custom_text_field.dart';

class InputsWidget {
  TextEditingController _valueController = new TextEditingController();

  void onInitView() {}
  void onDealloc() {
    _valueController.dispose();
  }

  Widget renderView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.rpx),
      child: Column(
        children: [
          CustomTextField(
            textFieldStyle: PITextFieldStyle(
              placeholder: "请输入内容",
            ),
            // placeholder: "请输入内容",
            // showPrefixIcon: false,
          ),
          SizedBox(height: 32.rpx),
          CustomTextField(
            textFieldStyle: PITextFieldStyle(
              placeholder: "请输入内容",
              showPrefixIcon: true,
              showClearButton: true,
              controller: _valueController,
            ),
            // placeholder: "请输入内容",
            // showPrefixIcon: true,
            // showClearButton: true,
            // controller: _valueController,
          ),
          SizedBox(height: 32.rpx),
          CustomTextField(
            textFieldStyle: PITextFieldStyle(
              placeholder: "请输入内容",
              showPrefixIcon: true,
              isSearch: true,
              textInputAction: TextInputAction.search,
            ),
            // placeholder: "请输入内容",
            // showPrefixIcon: true,
            // isSearch: true,
            // textInputAction: TextInputAction.search,
          ),
          SizedBox(height: 32.rpx),
          CustomTextField(
            // placeholder: "请输入内容",
            // showBorder: false,
            textFieldStyle: PITextFieldStyle(
              placeholder: "请输入内容",
              showBorder: false,
            ),
          ),
        ],
      ),
    );
  }
}
