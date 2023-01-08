import 'package:flutter/material.dart';

const primaryColor = Color(0xff101D40);
const primaryLightColor = Color(0xff223F8F);
const accentColor = Color(0xFF5E000C);
const accentLightColor = Color(0xFFB70018);

const double defaultPadding = 16.0;

const int cashDiscountPercent = 2;

final Map<String, String> optionPaymentChannel = {
  '1': 'เงินสด ลด $cashDiscountPercent %',
  '2': 'เครดิต 7 วัน',
  '3': 'เครดิต 15 วัน',
  '4': 'เครดิต 30 วัน',
  '5': 'เครดิต 60 วัน',
  '6': 'เครดิต 90 วัน',
};
