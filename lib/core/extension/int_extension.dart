import 'package:favorite_meat/ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return YPSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return YPSizeFit.setRpx(this.toDouble());
  }
}