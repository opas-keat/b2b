import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF101D40);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const darkBlueColor = Color(0xff101D40);
const darkRedColor = Color(0xFF5E000C);

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
