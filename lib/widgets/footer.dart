import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 48),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.border, width: 1),
        ),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'Built with precision by ', style: AppTheme.mono12mutedPlain),
              TextSpan(text: 'Saurabh', style: AppTheme.mono12cyan),
              TextSpan(text: ' · Flutter Developer · © 2026', style: AppTheme.mono12mutedPlain),
            ],
          ),
        ),
      ),
    );
  }
}
