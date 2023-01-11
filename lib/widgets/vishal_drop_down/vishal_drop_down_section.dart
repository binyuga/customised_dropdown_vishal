import 'package:flutter/material.dart';

class VishalDropDownSection extends StatelessWidget {
  VishalDropDownSection({
    ///Drop down section is a set of dropdown elements with separated border and header
    Key? key,
    required this.children,
    this.header,
    this.headerStyle,
  }) : super(key: key);
  final List<Widget>? children;
  String? header;
  TextStyle? headerStyle;

  @override
  Widget build(BuildContext context) {
    headerStyle ??= headerStyle = const TextStyle(
        color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 12);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header != null
              ? Text(
                  header!,
                  style: headerStyle,
                )
              : const SizedBox(
                  height: 0,
                ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                List.generate(children!.length, (index) => children![index]) +
                    [
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black,
                      )
                    ],
          ),
        ],
      ),
    );
  }
}
