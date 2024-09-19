library ndmob;

import 'package:ndmob/admob/_exp.dart';

/// A Calculator.
class Ndmob {
  static late AdmobManager _manager;

  static void init(AdmobManager adManager) {
    _manager = adManager;
  }

  static Widget adBanner({Key? key, Widget? adFailedWidget}) => AdmobBanner(
        key: key,
        adFailedWidget: adFailedWidget,
        manager: _manager,
      );

  static Widget adNative({Key? key, Widget? adFailedWidget}) => AdmobNative(
        key: key,
        adFailedWidget: adFailedWidget,
        manager: _manager,
      );

  static void showAdInterstitial() {
    final interstitial = AdmobInterstitial(_manager);
    interstitial.showAd();
  }
}
