import '../_exp.dart';

class AdmobNative extends StatefulWidget {
  final Widget? adFailedWidget;
  final AdmobManager manager;
  const AdmobNative({
    required super.key,
    required this.manager,
    required this.adFailedWidget,
  });

  @override
  State<AdmobNative> createState() => _AdmobNativeState();
}

class _AdmobNativeState extends State<AdmobNative> {
  NativeAd? _ad;

  @override
  void initState() {
    super.initState();
    NativeAd(
      adUnitId: widget.manager.adUnitId,
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
      ),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _ad = ad as NativeAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
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

  @override
  Widget build(BuildContext context) {
    return _ad != null
        ? Center(
            child: AdWidget(
              key: widget.key,
              ad: _ad!,
            ),
          )
        : widget.adFailedWidget ?? const SizedBox.shrink();
  }
}
