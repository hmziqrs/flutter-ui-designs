import 'package:flutter/material.dart';

import 'AppDimensions.dart';

abstract class TextStyles {
  static TextStyle heading1;
  static TextStyle heading16;
  static TextStyle heading14;
  static TextStyle heading13;

  static TextStyle heading2;
  static TextStyle heading26;
  static TextStyle heading24;
  static TextStyle heading23;

  static TextStyle heading3;
  static TextStyle heading36;
  static TextStyle heading34;
  static TextStyle heading33;

  static TextStyle heading4;
  static TextStyle heading46;
  static TextStyle heading44;
  static TextStyle heading43;

  static TextStyle heading5;
  static TextStyle heading56;
  static TextStyle heading54;
  static TextStyle heading53;

  static TextStyle heading6;
  static TextStyle heading66;
  static TextStyle heading64;
  static TextStyle heading63;

  static TextStyle body17;
  static TextStyle body16;
  static TextStyle body1;
  static TextStyle body13;

  static TextStyle body27;
  static TextStyle body26;
  static TextStyle body2;
  static TextStyle body23;

  static TextStyle body37;
  static TextStyle body36;
  static TextStyle body3;
  static TextStyle body33;

  static init() {
    initHeadings();
    initBody();
  }

  static void initHeadings() {
    heading1 = TextStyle(
      fontSize: 16 + AppDimensions.ratio * 6.5,
      fontWeight: FontWeight.w700,
    );
    heading16 = heading1.copyWith(
      fontWeight: FontWeight.w600,
    );
    heading14 = heading1.copyWith(
      fontWeight: FontWeight.w400,
    );
    heading13 = heading1.copyWith(
      fontWeight: FontWeight.w300,
    );

    heading2 = TextStyle(
      fontSize: 15 + AppDimensions.ratio * 6.0,
      fontWeight: FontWeight.w700,
    );
    heading26 = heading2.copyWith(
      fontWeight: FontWeight.w600,
    );
    heading24 = heading2.copyWith(
      fontWeight: FontWeight.w400,
    );
    heading23 = heading2.copyWith(
      fontWeight: FontWeight.w300,
    );

    heading3 = TextStyle(
      fontSize: 13 + AppDimensions.ratio * 5.5,
      fontWeight: FontWeight.w700,
    );
    heading36 = heading3.copyWith(
      fontWeight: FontWeight.w600,
    );
    heading34 = heading3.copyWith(
      fontWeight: FontWeight.w400,
    );
    heading33 = heading3.copyWith(
      fontWeight: FontWeight.w300,
    );

    heading4 = TextStyle(
      fontSize: 11 + AppDimensions.ratio * 5,
      fontWeight: FontWeight.w700,
    );
    heading46 = heading4.copyWith(
      fontWeight: FontWeight.w600,
    );
    heading44 = heading4.copyWith(
      fontWeight: FontWeight.w400,
    );
    heading43 = heading4.copyWith(
      fontWeight: FontWeight.w300,
    );

    heading5 = TextStyle(
      fontSize: 10 + AppDimensions.ratio * 4,
      fontWeight: FontWeight.w700,
    );
    heading56 = heading5.copyWith(
      fontWeight: FontWeight.w600,
    );
    heading54 = heading5.copyWith(
      fontWeight: FontWeight.w400,
    );
    heading53 = heading5.copyWith(
      fontWeight: FontWeight.w300,
    );

    heading6 = TextStyle(
      fontSize: 9 + AppDimensions.ratio * 3.5,
      fontWeight: FontWeight.w700,
    );
    heading66 = heading6.copyWith(
      fontWeight: FontWeight.w600,
    );
    heading64 = heading6.copyWith(
      fontWeight: FontWeight.w400,
    );
    heading63 = heading6.copyWith(
      fontWeight: FontWeight.w300,
    );
  }

  static void initBody() {
    body1 = TextStyle(
      fontSize: 8 + AppDimensions.ratio * 3.5,
      fontWeight: FontWeight.w400,
    );
    body17 = body1.copyWith(
      fontWeight: FontWeight.w700,
    );
    body16 = body1.copyWith(
      fontWeight: FontWeight.w600,
    );
    body13 = body1.copyWith(
      fontWeight: FontWeight.w300,
    );

    body2 = TextStyle(
      fontSize: 7 + AppDimensions.ratio * 3.2,
      fontWeight: FontWeight.w400,
    );
    body27 = body2.copyWith(
      fontWeight: FontWeight.w700,
    );
    body26 = body2.copyWith(
      fontWeight: FontWeight.w600,
    );
    body23 = body2.copyWith(
      fontWeight: FontWeight.w300,
    );

    body3 = TextStyle(
      fontSize: 6 + AppDimensions.ratio * 3.0,
      fontWeight: FontWeight.w400,
    );
    body37 = body3.copyWith(
      fontWeight: FontWeight.w700,
    );
    body36 = body3.copyWith(
      fontWeight: FontWeight.w600,
    );
    body33 = body3.copyWith(
      fontWeight: FontWeight.w300,
    );
  }
}
