import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';

class _Indicator {
  final String status;
  final Color color;

  const _Indicator(this.status, this.color);
}

class SeatsCategories extends StatelessWidget {
  const SeatsCategories();

  static final _indicators1 = [
    _Indicator(LocaleKeys.Normal.tr(), Colors.white),
    _Indicator(LocaleKeys.Comfort.tr(), Colors.yellow[200]!),
    _Indicator('VIP', Colors.yellow[600]!),
  ];

  static final _indicators2 = [
    _Indicator(LocaleKeys.Taken.tr(), Color(0xFF5A5A5A)),
    _Indicator(LocaleKeys.Selected.tr(), Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var indicator in _indicators1)
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
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 0,
            ),
            for (var indicator in _indicators2)
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
              ),
            SizedBox(
              width: 0,
            ),
          ],
        ),
      ]),
    );
  }
}
