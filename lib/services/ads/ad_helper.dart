import 'dart:developer';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  InterstitialAd? _interstitialAd;
  BannerAd? bannerAd;
  bool _isInterstitialAdReady = false;

  //Banner Ad
  static BannerAd loadBannerAd(String adUnitId, AdSize size) {
    BannerAd bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: size,
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

  //Interstitial ad
  void loadInterstitialAd(String adUnitId) {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('InterstitialAd failed to load: $error');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_isInterstitialAdReady && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) => log('Ad showed.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          log('Ad dismissed.');
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          log('Ad failed to show: $error');
          ad.dispose();
        },
      );

      _interstitialAd!.show();
      _isInterstitialAdReady = false;
    } else {
      log('Interstitial ad is not ready yet.');
    }
  }

  void dispose() {
    _interstitialAd?.dispose();
  }
}
