import 'package:flutter/material.dart';

import '../../data/constants.dart';

class CommonMenuButton extends StatelessWidget {
  CommonMenuButton({
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final String title;
  final IconData icon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextButton.icon(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: blackColor.withOpacity(0.0)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.fromLTRB(5, 10, 0, 10)),
          overlayColor: MaterialStateProperty.all<Color>(
            outlineColor.withOpacity(0.1),
          ),
        ),
        onPressed: onTap as void Function(),
        icon: Icon(icon, color: blackColor.withOpacity(0.5)),
        label: Text(title, style: t2TextStyle),
      ),
    );
  }
}

class CommonCallToActionButton extends StatelessWidget {
  CommonCallToActionButton({
    required this.hoverColor,
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.opacityBorder = 0.5,
    this.opacityBack = 0.5,
    this.radius = 10,
    this.padHorizontal = 10,
    this.padVertical = 10,
  });
  final Color backgroundColor;
  final double opacityBack;
  final Color hoverColor;
  final double opacityBorder;
  final Function onPressed;
  final String text;
  final IconData icon;
  final double radius;
  final double padHorizontal;
  final double padVertical;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function(),
      // color: isSubmitting ? Colors.grey : color,
      icon: Icon(icon, color: mainColor),
      label: Text(text, style: t1TextStyleMetod(color: mainColor)),
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        backgroundColor: MaterialStateProperty.all<Color>(hoverColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: hoverColor.withOpacity(opacityBorder)),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: padHorizontal,
            vertical: padVertical,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          hoverColor.withOpacity(opacityBack),
        ),
      ),

      // child: Text(
      //   this.isSubmitting ? "Submitting..." : "Submit Message",)
    );
  }
}
