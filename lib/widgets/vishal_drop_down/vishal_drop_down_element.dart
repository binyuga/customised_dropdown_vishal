import 'package:flutter/material.dart';

typedef ClickedClass = void Function();

class VishalDropDownElement extends StatelessWidget {
  ///the Drop Down elements are used as an element of dropdown overlays atomic unit
  final Widget? leadingIcon;
  final Widget? center;
  final Widget? trailingIcon;
  final ClickedClass onClick;
  const VishalDropDownElement({
    Key? key,
    this.leadingIcon,
    this.center,
    this.trailingIcon,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 5),
                alignment: Alignment.centerLeft,
                child: leadingIcon != null ? leadingIcon! : Container()),
            Container(alignment: Alignment.centerLeft, child: center!),
            const Spacer(),
            Container(
                alignment: Alignment.centerRight,
                child: trailingIcon != null ? trailingIcon! : Container())
          ],
        ),
      ),
    );
  }
}
