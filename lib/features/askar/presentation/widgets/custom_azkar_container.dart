import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';

class CustomAzkarContainer extends StatelessWidget {
  const CustomAzkarContainer(
      {super.key, required this.containerText, required this.assetImage});
  final String containerText;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 8),
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(
            color: appColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 220,
            height: 145,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                    image: AssetImage(assetImage), fit: BoxFit.cover)),
          ),
          Text(
            containerText,
            style:  TextStyle(
                color: appColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
