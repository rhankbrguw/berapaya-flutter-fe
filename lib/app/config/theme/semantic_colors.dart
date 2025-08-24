import 'package:berapaya_fe_flutter/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.info,
    required this.success,
    required this.warning,
    required this.tips,
  });

  final Color? info;
  final Color? success;
  final Color? warning;
  final Color? tips;

  @override
  AppSemanticColors copyWith({
    Color? info,
    Color? success,
    Color? warning,
    Color? tips,
  }) {
    return AppSemanticColors(
      info: info ?? this.info,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      tips: tips ?? this.tips,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) {
      return this;
    }
    return AppSemanticColors(
      info: Color.lerp(info, other.info, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
      tips: Color.lerp(tips, other.tips, t),
    );
  }
}

const lightSemanticColors = AppSemanticColors(
  info: AppColors.blueInfo,
  success: AppColors.greenSuccess,
  warning: AppColors.orangeWarning,
  tips: AppColors.purpleTips,
);

const darkSemanticColors = AppSemanticColors(
  info: AppColors.blueInfo,
  success: AppColors.greenSuccess,
  warning: AppColors.orangeWarning,
  tips: AppColors.purpleTips,
);
