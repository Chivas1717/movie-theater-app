import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

class SavePasswordButton extends StatelessWidget {
  final VoidCallback onTap;
  const SavePasswordButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      child: TextButton(
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [Color(0xFFf03400), Color(0xFFf04f00)],
            ),
          ),
          child: Center(
            child: Text(
              LocaleKeys.Confirm.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                letterSpacing: 0.7,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
