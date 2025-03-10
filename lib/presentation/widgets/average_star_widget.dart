import 'package:flutter/material.dart';

class AverageStarWidget extends StatelessWidget {
  const AverageStarWidget({super.key, required voteAverage}) : voteAverage = voteAverage / 2;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for(int i = 1; i < 6; i++)
          voteAverage - i >= 1
              ? Icon(Icons.star_rate_rounded, size: 30, color: Color(0xFFE9B149),)
              : voteAverage - i >= 0.5 ? Icon(Icons.star_half_rounded, size: 30, color: Color(0xFFE9B149),)
              : Icon(Icons.star_border_rounded, size: 30, color: Color(0xFFE9B149),),
      ],
    );
  }
}
