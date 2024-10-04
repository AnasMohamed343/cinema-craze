import 'package:flutter/material.dart';

import '../../utils/colors_manager.dart';

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        iconSize: 60,
        color: ColorsManager.whiteColor,
        icon: const Icon(Icons.play_circle));
  }
}
