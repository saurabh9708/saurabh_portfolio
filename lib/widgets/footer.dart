import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: AppTheme.getHorizontalPadding(context),
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.border, width: 1),
        ),
      ),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Built with precision by ', style: AppTheme.mono12mutedPlain),
            Text('Saurabh', style: AppTheme.mono12cyan),
            Text(' · Flutter Developer · © 2026', style: AppTheme.mono12mutedPlain),
          ],
        ),
      ),
    );
  }
}
