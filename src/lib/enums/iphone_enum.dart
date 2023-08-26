import 'package:flutter/material.dart';

// レスポンシブデザインで使用する際の、基準となるデバイスのサイズたち

enum IPhoneVersion {
  iPhone4, // iPhone 4, 4S
  iPhone5, // iPhone 5, 5S, SE (1st generation)
  iPhone6, // iPhone 6, 6S, 7, 8, SE (2nd generation)
  iPhone6Plus, // iPhone 6 Plus, 6S Plus, 7 Plus, 8 Plus
  iPhoneX, // iPhone X, XS, 11 Pro
  iPhoneXR, // iPhone XR, 11
  iPhoneXSMAX, // iPhone XS Max, 11 Pro Max
  iPhone12Mini, // iPhone 12 Mini
  iPhone12, // iPhone 12, 13
  iPhone12Pro, // iPhone 12 Pro, 13 Pro
  iPhone12ProMAX, // iPhone 12 Pro Max, 13 Pro Max
  iPhone14,
}

class IPhoneScreenSize {
  static Size getSize(IPhoneVersion version) {
    switch (version) {
      case IPhoneVersion.iPhone4:
        return const Size(320, 480);
      case IPhoneVersion.iPhone5:
        return const Size(320, 568);
      case IPhoneVersion.iPhone6:
        return const Size(375, 667);
      case IPhoneVersion.iPhone6Plus:
        return const Size(414, 736);
      case IPhoneVersion.iPhoneX:
        return const Size(375, 812);
      case IPhoneVersion.iPhoneXR:
        return const Size(414, 896);
      case IPhoneVersion.iPhoneXSMAX:
        return const Size(414, 896);
      case IPhoneVersion.iPhone12Mini:
        return const Size(360, 780);
      case IPhoneVersion.iPhone12:
        return const Size(390, 844);
      case IPhoneVersion.iPhone12Pro:
        return const Size(390, 844);
      case IPhoneVersion.iPhone12ProMAX:
        return const Size(428, 926);
      case IPhoneVersion.iPhone14:
        return const Size(390, 844);
      default:
        // Default size for unknown versions
        return const Size(390, 844);
    }
  }
}
