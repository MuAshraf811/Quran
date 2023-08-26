
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'custom_clipper.dart';

class UpperClippedContainer extends StatelessWidget {
  const UpperClippedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UpperColumnClipper(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        height: 88,
        width: double.infinity,
        color: appColor,
        child: const Center(
          child: Text(
            'بّسًم ٱللۂ ٱلرحًمنٌ ٱلرحًيّم.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
