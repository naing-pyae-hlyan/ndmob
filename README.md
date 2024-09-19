<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Google Mobile Ads for Flutter

[![google_mobile_ads](https://github.com/googleads/googleads-mobile-flutter/actions/workflows/google_mobile_ads.yaml/badge.svg)](https://github.com/googleads/googleads-mobile-flutter/actions/workflows/google_mobile_ads.yaml)

This repository contains the source code for the Google Mobile Ads Flutter
plugin, which enables publishers to monetize [Flutter](https://flutter.dev/)
apps using the Google Mobile Ads SDK.

## Tips
I am so boring, So that I have created easy Admob banner to use only for me.
Please don't use this s**t code to your production.

## Features

TODO: Need to add more RewardedBanner, RewardedInterstitialBanner, etc...

## Getting started


To use this package. run
```flutter pub add ndmob```

## Usage
Before add this ndmob package, you must run this flutter pub command.
```flutter pub add google_mobile_ads```

## Then
Add your main.dart file this following code.
```
void main() {
    WidgetsFlutterBinding.ensureIntialized();
    MobileAds.instance.initialize();
    Ndmob.init(AdmobManager(
      adUnitId: "ca-app-pub-3940256099942544~3347511713",
      bannerAdUnitIdAndroid: "ca-app-pub-3940256099942544/6300978111",
      bannerAdUnitIdIOS: "ca-app-pub-3940256099942544/2934735716",
      nativeAdUnitIdAndroid: "ca-app-pub-3940256099942544/1033173712",
      nativeAdUnitIdIOS: "ca-app-pub-3940256099942544/4411468910",
      interstitialAdUnitIdAndroid: "ca-app-pub-3940256099942544/2247696110",
      interstitialAdUnitIdIOS: "ca-app-pub-3940256099942544/3986624511",
    ));

      runApp(const MaterialApp(
        home: const MyWidget(),
      ));
}
```

## To use Ndmob banners.
```
import 'package:ndmob/ndmob.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Ndmob.adBanner(adFailedWidget: const Text("Empty Ads")),
            const SizedBox(height: 32),
            Ndmob.adNative(),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Ndmob.showAdInterstitial();
              },
              child: const Icon(Icons.fullscreen),
            ),
          ],
        ),
      ),
    );
  }
}
```

## License

[Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0)
