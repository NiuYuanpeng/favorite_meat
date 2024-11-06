import 'package:favorite_meat/ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return YPSizeFit.setPx(this);
  }

  double get rpx {
    return YPSizeFit.setRpx(this);
  }
}
