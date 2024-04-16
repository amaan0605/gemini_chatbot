import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobProvider extends ChangeNotifier {
  String adUnit = 'ca-app-pub-5213209276458650/3867673722';
  BannerAd? _bannerAd;
}
