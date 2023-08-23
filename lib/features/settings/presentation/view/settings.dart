import 'package:flutter/material.dart';

import '../widgets/switch.dart';

class SettingsVieew extends StatelessWidget {
  const SettingsVieew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CustomSwitch(),
        ],
      ),
    );
  }
}
