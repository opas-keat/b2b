import 'package:flutter/material.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

const backendUrl = "https://qtntktogobtletqbvjqy.nhost.run";
late NhostClient nhostClient;

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

const logActionLogin = "เข้าสู่ระบบ";
const logActionAddProduct = "เพิ่มสินค้า";
const logActionEditProduct = "แก้ไขสินค้า";
const logActionDelete = "ลบสินค้า";
const logActionDisableDealer = "ปิดร้านค้า";
const logActionEnableDealer = "เปิดร้านค้า";

// const BASE_IMAGE_URL = "https://image.tmdb.org/t/p/";
// const IMAGE_SIZE_ORIGINAL = "original";
// const BACKDROP_SIZE_W300 = "w300";
// const BACKDROP_SIZE_w780 = "w780";
// const BACKDROP_SIZE_w1280 = "w1280";
// const POSTER_SIZE_W92 = "w92";
// const POSTER_SIZE_W154 = "w154";
// const POSTER_SIZE_W185 = "w185";
// const POSTER_SIZE_W342 = "w342";
// const POSTER_SIZE_W500 = "w500";
// const POSTER_SIZE_W780 = "w780";
// const INVALID_EMAIL_OR_PASSWORD = 'อีเมลหรือรหัสผ่าน ไม่ถูกต้อง';
// const PRODUCT_NOT_FOUND = '';


