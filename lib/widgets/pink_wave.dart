import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PinkWaveWidget extends StatelessWidget {
  const PinkWaveWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      duration: 1,
      config: CustomConfig(
        gradients: [
          [MAIN_PINK, WHITE],
          [MAIN_PINK, WHITE],
          [MAIN_PINK, WHITE],
          [MAIN_PINK, WHITE]
        ],
        durations: [screenHeightPercentage(context, percentage: 0.00014).round(), screenHeightPercentage(context, percentage: 0.00014).round(), screenHeightPercentage(context, percentage: 0.00014).round(), screenHeightPercentage(context, percentage: 0.00014).round()],
        heightPercentages: [screenHeightPercentage(context, percentage: 0.00014), screenHeightPercentage(context, percentage: 0.00015), screenHeightPercentage(context, percentage: 0.00016), screenHeightPercentage(context, percentage: 0.00017)],
        blur: MaskFilter.blur(BlurStyle.inner, screenHeightPercentage(context, percentage: 0.40)),
      ),
      waveAmplitude: 1.0,
      size: Size(double.infinity, screenHeightPercentage(context, percentage: 0.240)),
    );
  }
}