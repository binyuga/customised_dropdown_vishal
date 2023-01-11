import 'package:flutter/material.dart';

typedef OnClickMethod(bool tappeed);

enum OverlayOrientation { leftBottom, rightBottom, onButtonLeft, onButtonRight }

class VishalDropDownButton extends StatefulWidget {
  VishalDropDownButton(
      {Key? key,
      this.backgroundColor,
      this.height,
      this.width,
      this.padding,
      this.margin,
      required this.children,
      this.decoration,
      this.leading,
      required this.overlayWidth,
      required this.orientation,
      required this.overlayHeight,
      this.showDropDownIcon = true})
      : super(key: key);

  Color? backgroundColor;
  final OverlayOrientation? orientation;
  Widget? leading;
  final double overlayWidth;
  final double overlayHeight;
  bool? showDropDownIcon;
  double? height;
  EdgeInsets? padding;
  EdgeInsets? margin;
  BoxDecoration? decoration;
  double? width;
  final List<Widget> children;

  @override
  State<VishalDropDownButton> createState() => _VishalDropDownButtonState();
}

class _VishalDropDownButtonState extends State<VishalDropDownButton> {
  bool tapped = false;
  GlobalKey key = GlobalKey();

  OverlayEntry? _overlayEntry;

  Offset? buttonPosition;
  Size? buttonSize;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    //_getPosition();
    widget.backgroundColor ??= Colors.transparent;
  }

  ///For Opening the Overlay
  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        Positioned positioned;
        double top = 0, right = 0, left = 0;

        ///Overlay Orientation is decided from below code
        if (widget.orientation == OverlayOrientation.rightBottom) {
          top = buttonPosition!.dy + buttonSize!.height;
          left = buttonPosition!.dx;
          positioned = Positioned(
            top: top,
            left: left,
            width: widget.overlayWidth,
            height: widget.overlayHeight,
            child: Material(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Scrollbar(
                    trackVisibility: true,
                    interactive: true,
                    child: ListView.builder(
                        itemCount: widget.children.length,
                        itemBuilder: (context, index) {
                          return widget.children[index];
                        }),
                  ),
                ) //code for the drop-down menu...,
                ),
          );
        } else if (widget.orientation == OverlayOrientation.leftBottom) {
          top = buttonPosition!.dy + buttonSize!.height;
          right = buttonPosition!.dx;
          positioned = Positioned(
            top: top,
            right: right,
            width: widget.overlayWidth,
            height: 250,
            child: Material(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Scrollbar(
                    trackVisibility: true,
                    interactive: true,
                    child: ListView.builder(
                        itemCount: widget.children.length,
                        itemBuilder: (context, index) {
                          return widget.children[index];
                        }),
                  ),
                ) //code for the drop-down menu...,
                ),
          );
        } else if (widget.orientation == OverlayOrientation.onButtonRight) {
          top = buttonPosition!.dy;
          left = buttonPosition!.dx;
          positioned = Positioned(
            top: top,
            left: left,
            width: widget.overlayWidth,
            height: 250,
            child: Material(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Scrollbar(
                    trackVisibility: true,
                    interactive: true,
                    child: ListView.builder(
                        itemCount: widget.children.length,
                        itemBuilder: (context, index) {
                          return widget.children[index];
                        }),
                  ),
                ) //code for the drop-down menu...,
                ),
          );
        } else if (widget.orientation == OverlayOrientation.onButtonLeft) {
          top = buttonPosition!.dy;
          right = buttonPosition!.dx;
          positioned = Positioned(
            top: top,
            right: right,
            width: widget.overlayWidth,
            height: widget.height,
            child: Material(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Scrollbar(
                    trackVisibility: true,
                    interactive: true,
                    child: ListView.builder(
                        itemCount: widget.children.length,
                        itemBuilder: (context, index) {
                          return widget.children[index];
                        }),
                  ),
                ) //code for the drop-down menu...,
                ),
          );
        } else {
          top = buttonPosition!.dy + buttonSize!.height;
          right = buttonPosition!.dx;
          positioned = Positioned(
            top: top,
            right: right,
            width: widget.overlayWidth,
            height: 250,
            child: Material(
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Scrollbar(
                    trackVisibility: true,
                    interactive: true,
                    child: ListView.builder(
                        itemCount: widget.children.length,
                        itemBuilder: (context, index) {
                          return widget.children[index];
                        }),
                  ),
                ) //code for the drop-down menu...,
                ),
          );
        }
        return Stack(
          children: [
            ///after tapping outside the overlay the overlay will get automatically closed with below filled widget
            Positioned.fill(
                child: GestureDetector(
              onTap: () {
                closeMenu();
              },
              child: Container(
                color: Colors.transparent,
              ),
            )),

            ///The overlay
            positioned,
          ],
        );
      },
    );
  }

  void openMenu() {
    ///this code open the overlay menu
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    buttonPosition = box.localToGlobal(Offset.zero);
    buttonSize = box.size;
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  void closeMenu() {
    ///this code closes the overlay menu
    _overlayEntry!.remove();
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    ///this is code for building dropdown button
    return Container(
      key: key,
      child: GestureDetector(
        onTap: () {
          setState(() {
            tapped ? tapped = false : tapped = true;
            if (isMenuOpen) {
              closeMenu();
            } else {
              openMenu();
            }
          });
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          margin: widget.margin,
          decoration: widget.decoration,
          padding: widget.padding,
          color: widget.decoration == null ? widget.backgroundColor : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.leading == null
                  ? Text(
                      'Click here',
                      style: TextStyle(
                        color: ThemeData().brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    )
                  : widget.leading!,
              widget.showDropDownIcon!
                  ? Icon(
                      tapped == true
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: ThemeData().brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      size: 20)
                  : SizedBox(
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
