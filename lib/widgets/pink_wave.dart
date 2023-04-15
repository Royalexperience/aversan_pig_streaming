import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PinkWaveWidget extends StatelessWidget {
  const PinkWaveWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_TRANSPARENT,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [MAIN_PINK, WHITE],
            [MAIN_PINK, WHITE],
          ],
          // Durate delle animazioni per ogni colore
          durations: [4000, 5000,], 
          // Percentuale di altezza per ogni colore.
          heightPercentages: [0.01, 0.05,],
          // Intensità della sfocatura per le onde
          blur: MaskFilter.blur(BlurStyle.solid, 9),
        ),
        waveAmplitude: 45.00, // Ampiezza delle curve
        waveFrequency: 1, // Numero di curve in un onda
        backgroundColor: COLOR_TRANSPARENT, // Colore di sfondo
        size: Size(
          double.infinity, // L'onda occupa tutto lo spazio disponibile in ampiezza
          screenHeightPercentage(context, percentage: 0.180),
        ),
      ),
    );
  }
}