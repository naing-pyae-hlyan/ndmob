import '../_exp.dart';

class AdmobInterstitial {
  InterstitialAd? _interstitialAd;
  final AdmobManager manager;
  AdmobInterstitial(this.manager) {
    // https://developers.google.com/admob/flutter/interstitial
    _loadAd();
  }

  void showAd() {
    if (_interstitialAd != null) {
      _interstitialAd?.show();
    } else {
      _loadAd();
      showAd();
    }
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: manager.adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            // Called when the ad showed the full screen content.
            onAdShowedFullScreenContent: (ad) {},
            // Called when an impression occurs on the ad.
            onAdImpression: (ad) {},
            // Called when the ad failed to show full screen content.
            onAdFailedToShowFullScreenContent: (ad, err) {
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            // Called when the ad dismissed full screen content.
            onAdDismissedFullScreenContent: (ad) {
              // Dispose the ad here to free resources.
              ad.dispose();
            },
            // Called when a click is recorded for an ad.
            onAdClicked: (ad) {},
          );
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }
}
