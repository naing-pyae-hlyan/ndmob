import '../_exp.dart';

class AdmobBanner extends StatefulWidget {
  final Widget? adFailedWidget;
  final AdmobManager manager;
  const AdmobBanner({
    required super.key,
    required this.manager,
    required this.adFailedWidget,
  });

  @override
  State<AdmobBanner> createState() => _AdmobBannerState();
}

class _AdmobBannerState extends State<AdmobBanner> {
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();
    BannerAd(
      size: AdSize.banner,
      adUnitId: widget.manager.adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _ad = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    if (mounted) _ad?.dispose();
    super.dispose();
  }
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _createBannerAd();
  // }

  // Future<void> _createBannerAd() async {
  //   await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
  //     MediaQuery.sizeOf(context).width.truncate(),
  //   ).then((AnchoredAdaptiveBannerAdSize? size) => _bannerAd = BannerAd(
  //         adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //         size: size ?? AdSize.banner,
  //         request: const AdRequest(),
  //         listener: BannerAdListener(
  //           onAdLoaded: (Ad ad) {},
  //           onAdFailedToLoad: (Ad advertisement, LoadAdError error) =>
  //               advertisement.dispose(),
  //         ),
  //       )..load());
  // }

  @override
  Widget build(BuildContext context) {
    return _ad != null
        ? Center(
            child: SizedBox(
              width: _ad?.size.width.toDouble(),
              height: _ad?.size.height.toDouble(),
              child: AdWidget(
                key: widget.key,
                ad: _ad!,
              ),
            ),
          )
        : widget.adFailedWidget ?? const SizedBox.shrink();
  }
}
