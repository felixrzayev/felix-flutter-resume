import 'package:flutter/material.dart';

// Colors
const blackColor = Color(0xFF151515);
const mainColor = Color(0xFFF4F4F4);
const backgroundColor = Color(0xFFFAFAFA);
const outlineColor = Color(0xFFF65F2F);

// Typography
const h1TextStyle = TextStyle(fontSize: 28, color: blackColor);
const h2TextStyle =
    TextStyle(fontSize: 22, color: blackColor, fontWeight: FontWeight.w600);
const h3TextStyle = TextStyle(fontSize: 22, color: blackColor);
const h4TextStyle =
    TextStyle(fontSize: 16, color: blackColor, fontWeight: FontWeight.w600);
const t1TextStyle = TextStyle(fontSize: 16, color: blackColor);
const t2TextStyle = TextStyle(fontSize: 14, color: blackColor);

TextStyle t1TextStyleMetod({Color color = blackColor, double fontSize = 16}) {
  return TextStyle(fontSize: fontSize, color: color);
}

const topPaddingSize = 32.0; // header padding
const pagePaddingSize = 18.0; // Padding used between blocks of information

const minTaletSize = 1160;

// Padding between blocks (Pages)

const verticalPagePadding = 54.0;
const horizontalPagePadding = 48.0;

const pageContentPadding = const EdgeInsets.symmetric(
  vertical: verticalPagePadding,
  horizontal: horizontalPagePadding,
);


// paddings 6, 12, 24, 30, 36, 42