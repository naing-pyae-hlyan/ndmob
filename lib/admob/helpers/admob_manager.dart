import 'dart:io';

class AdmobManager {
  // https://onlyflutter.com/flutter-ads-with-google-admob/

  final String? _adUnitId;
  final String? _bannerAdUnitIdAndroid;
  final String? _bannerAdUnitIdIOS;
  final String? _interstitialAdUnitIdAndroid;
  final String? _interstitialAdUnitIdIOS;
  final String? _nativeAdUnitIdAndroid;
  final String? _nativeAdUnitIdIOS;
  // final String? _rewardedAdUnitIdAndroid;
  // final String? _rewardedAdUnitIdIOS;

  AdmobManager({
    String? adUnitId,
    String? bannerAdUnitIdAndroid,
    String? bannerAdUnitIdIOS,
    String? interstitialAdUnitIdAndroid,
    String? interstitialAdUnitIdIOS,
    String? nativeAdUnitIdAndroid,
    String? nativeAdUnitIdIOS,
    // String? rewardedAdUnitIdAndroid,
    // String? rewardedAdUnitIdIOS,
  })  : _adUnitId = adUnitId,
        _nativeAdUnitIdIOS = nativeAdUnitIdIOS,
        _nativeAdUnitIdAndroid = nativeAdUnitIdAndroid,
        _interstitialAdUnitIdIOS = interstitialAdUnitIdIOS,
        _interstitialAdUnitIdAndroid = interstitialAdUnitIdAndroid,
        _bannerAdUnitIdIOS = bannerAdUnitIdIOS,
        _bannerAdUnitIdAndroid = bannerAdUnitIdAndroid;
  // _rewardedAdUnitIdIOS = rewardedAdUnitIdIOS,
  // _rewardedAdUnitIdAndroid = rewardedAdUnitIdAndroid;

  String get adUnitId => _adUnitId ?? "ca-app-pub-3940256099942544~3347511713";

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return _bannerAdUnitIdAndroid ?? 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return _bannerAdUnitIdIOS ?? 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return _interstitialAdUnitIdAndroid ??
          "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return _interstitialAdUnitIdIOS ??
          "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return _nativeAdUnitIdAndroid ?? 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return _nativeAdUnitIdIOS ?? 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }

  // String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return _rewardedAdUnitIdAndroid ??
  //         "ca-app-pub-3940256099942544/5224354917";
  //   } else if (Platform.isIOS) {
  //     return _rewardedAdUnitIdIOS ?? "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }
}
