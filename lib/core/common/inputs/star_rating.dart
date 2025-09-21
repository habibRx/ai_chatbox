import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int totalRating;
  final double currentRating;
  final double size;
  final Color? color;

  const StarRating({
    Key? key,
    this.totalRating = 5,
    required this.currentRating,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalRating, (index) {
        if (currentRating >= index + 1) {
          // Full star
          return Icon(
            Icons.star,
            color: color ?? Colors.amber,
            size: size,
          );
        } else if (currentRating >= index + 0.5) {
          // Half star
          return Icon(
            Icons.star_half,
            color: color ?? Colors.amber,
            size: size,
          );
        } else {
          // Empty star
          return Icon(
            Icons.star_border,
            color: color ?? Colors.amber,
            size: size,
          );
        }
      }),
    );
  }
}
