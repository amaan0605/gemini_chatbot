import 'dart:developer';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static BannerAd loadBannerAd(String adUnitId) {
    BannerAd bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.leaderboard,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          log('Banner Ad Loaded: $adUnitId');
        },
        onAdFailedToLoad: (ad, error) {
          log('Banner Ad Failed to Load: $adUnitId, $error');
          ad.dispose();
        },
      ),
    );

    bannerAd.load();
    return bannerAd;
  }
}
