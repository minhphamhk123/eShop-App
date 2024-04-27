import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: counterBgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Text("2",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: counterTextColor, fontSizeFactor: 0.8))),
            ))
      ],
    );
  }
}
