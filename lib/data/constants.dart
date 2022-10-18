import 'package:flutter/material.dart';

// TODO: Change mainColor to White
const mainColor = Color.fromARGB(255, 167, 223, 199);
const subColor = Color(0xff2D63BC);

const textColor = Colors.black87;

const header1TextStyle = TextStyle(fontSize: 22, color: textColor);
const header2TextStyle = TextStyle(fontSize: 18, color: textColor);
const header2BoldTextStyle = TextStyle(
  fontSize: 18,
  color: textColor,
  fontWeight: FontWeight.bold,
);
const header2ItalicTextStyle =
    TextStyle(fontSize: 18, color: textColor, fontStyle: FontStyle.italic);

const header3BoldTextStyle = TextStyle(
  fontSize: 16,
  color: textColor,
  fontWeight: FontWeight.bold,
);

const bulletPointTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.black87,
);

const topPaddingSize = 32.0; // header padding
const pagePaddingSize = 18.0; // Padding used between blocks of information

const minTaletSize = 1080;

// Padding between blocks (Pages)

const verticalPagePadding = 54.0;
const horizontalPagePadding = 48.0;

const pageContentPadding = const EdgeInsets.symmetric(
  vertical: verticalPagePadding,
  horizontal: horizontalPagePadding,
);
