import 'package:flutter/material.dart';

class _Indicator {
  final String status;
  final Color color;

  const _Indicator(this.status, this.color);
}

class SeatsCategories extends StatelessWidget {
  const SeatsCategories();

  static const _indicators = [
    _Indicator('Available', Colors.white),
    _Indicator('Taken', Color(0xFF5A5A5A)),
    _Indicator('Selected', Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var indicator in _indicators)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Color indicator circle
                SizedBox(
                  height: 9,
                  width: 9,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: indicator.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  indicator.status,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )
        ],
      ),
    );
  }
}
