import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobProvider extends ChangeNotifier {
  BannerAd? _bannerAd; // The BannerAd Object to be loaded
  AppOpenAd? _appOpenAd;
  AppOpenAd? get appOpenAd => _appOpenAd;
  BannerAd? get bannerAd => _bannerAd;

  set bannerAd(BannerAd? ad) {
    _bannerAd = ad;
    notifyListeners();
  }

  set appOpenAd(AppOpenAd? ad) {
    _appOpenAd = ad;
    notifyListeners();
  }

  bool _loadingAd = false; // Boolean flag to check the loading status of Ad

  bool get loadingAd => _loadingAd;

  set loadingAd(bool val) {
    _loadingAd = val;
    notifyListeners();
  }

  // Load Banner Ad
  void loadBannerAd(String bannerAdID) async {
    loadingAd = true;
    log('loading ad $bannerAdID');
    await _bannerAd?.dispose();
    bannerAd = BannerAd(
      adUnitId: bannerAdID,
      request: const AdRequest(),
      size: AdSize.leaderboard,
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdClicked: (_) {},
        onAdFailedToLoad: (ad, err) {
          log('loading ad error $err');
        },
      ),
    );
    await _bannerAd?.load();
    loadingAd = false;
  }

//load close Ad
  loadCloseAd() async {
    loadingAd = true;
    log('loading ad $closeAppAdUnit');
    await _appOpenAd?.dispose();
    AppOpenAd.load(
        adUnitId: closeAppAdUnit,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            appOpenAd = ad;
            notifyListeners();
            appOpenAd!.show();
            notifyListeners();
          },
          onAdFailedToLoad: (err) {
            log('loading ad error $err');
          },
        ));
    loadingAd = false;
  }

  //Dispose ad units
  void disposeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }
}
