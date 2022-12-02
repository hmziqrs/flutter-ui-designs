import 'package:flutter/material.dart';

import 'AppDimensions.dart';

abstract class TextStyles {
  static late TextStyle heading1;
  static late TextStyle heading16;
  static late TextStyle heading14;
  static late TextStyle heading13;

  static late TextStyle heading2;
  static late TextStyle heading26;
  static late TextStyle heading24;
  static late TextStyle heading23;

  static late TextStyle heading3;
  static late TextStyle heading36;
  static late TextStyle heading34;
  static late TextStyle heading33;

  static late TextStyle heading4;
  static late TextStyle heading46;
  static late TextStyle heading44;
  static late TextStyle heading43;

  static late TextStyle heading5;
  static late TextStyle heading56;
  static late TextStyle heading54;
  static late TextStyle heading53;

  static late TextStyle heading6;
  static late TextStyle heading66;
  static late TextStyle heading64;
  static late TextStyle heading63;

  static late TextStyle body17;
  static late TextStyle body16;
  static late TextStyle body1;
  static late TextStyle body13;

  static late TextStyle body27;
  static late TextStyle body26;
  static late TextStyle body2;
  static late TextStyle body23;

  static late TextStyle body37;
  static late TextStyle body36;
  static late TextStyle body3;
  static late TextStyle body33;

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
