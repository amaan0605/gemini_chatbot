import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobProvider extends ChangeNotifier {
  BannerAd? bannerAd; // The BannerAd Object to be loaded
  AppOpenAd? _appOpenAd;
  AppOpenAd? get appOpenAd => _appOpenAd;
  // BannerAd? get bannerAd => _bannerAd;

  // set bannerAd(BannerAd? ad) {
  //   _bannerAd = ad;
  //   notifyListeners();
  // }

  set appOpenAd(AppOpenAd? ad) {
    _appOpenAd = ad;
    notifyListeners();
  }

  bool _loadingBannerAd =
      false; // Boolean flag to check the loading status of Ad

  bool get loadingBannerAd => _loadingBannerAd;

  set loadingBannerAd(bool val) {
    _loadingBannerAd = val;
    notifyListeners();
  }

  // Load Banner Ad
  void loadBannerAd(String bannerAdID) async {
    loadingBannerAd = true;
    notifyListeners();
    log('loading ad $bannerAdID');
    bannerAd = BannerAd(
      adUnitId: bannerAdID,
      request: const AdRequest(),
      size: AdSize.leaderboard,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          loadingBannerAd = false;
          notifyListeners();
        },
        onAdClicked: (_) {},
        onAdFailedToLoad: (ad, err) {
          log('loading ad error $err');
        },
      ),
    );
    await bannerAd?.load();
    loadingBannerAd = false;
    notifyListeners();
  }

//load close Ad
  loadCloseAd() async {
    loadingBannerAd = true;
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
    loadingBannerAd = false;
  }

  //Dispose ad units
  void disposeAd() {
    bannerAd?.dispose();
    bannerAd = null;
  }
}
