import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final skills = [
      ('🐦', 'Flutter', 0xFF54C5F8, 95),
      ('🎯', 'Dart', 0xFF00B4D8, 95),
      ('🔥', 'Firebase', 0xFFFFA000, 88),
      ('⚡', 'Supabase', 0xFF3ECF8E, 82),
      ('🔌', 'REST APIs', 0xFF00D4FF, 90),
      ('☁️', 'AWS', 0xFFFF9900, 72),
      ('▲', 'Vercel', 0xFFFFFFFF, 85),
      ('📜', 'JavaScript', 0xFFF7DF1E, 85),
      ('☕', 'Java', 0xFFED8B00, 80),
      ('🐙', 'Git & CI/CD', 0xFFF05032, 88),
      ('🏗', 'Clean Arch', 0xFF8B5CF6, 90),
      ('🔄', 'Riverpod', 0xFF00D4FF, 88),
      ('🗺', 'Google Maps', 0xFF00FFA3, 78),
      ('💳', 'Stripe SDK', 0xFF6366F1, 75),
    ];

    final hPadding = AppTheme.getHorizontalPadding(context);
    final vPadding = AppTheme.getVerticalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      color: AppTheme.bg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section label
              Row(
                children: [
                  Container(width: 28, height: 1, color: AppTheme.cyan),
                  const SizedBox(width: 10),
                  Text('TECHNICAL STACK', style: AppTheme.mono11cyan),
                ],
              ),
              const SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Tools I master',
                  style: AppTheme.syne48w800.copyWith(
                    fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 48),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 560,
                child: Text(
                  'A full cross-platform toolkit — from mobile to cloud.',
                  style: AppTheme.sans16muted.copyWith(
                    fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 16, minFactor: 0.9),
                  ),
                ),
              ),
              const SizedBox(height: 64),

              // Skills grid
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 900
                      ? 4
                      : MediaQuery.of(context).size.width > 600
                          ? 3
                          : 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: MediaQuery.of(context).size.width > 600 ? 1 : 0.9,
                ),
                children: skills.map((skill) {
                  return _HoverSkillCard(
                    icon: skill.$1,
                    name: skill.$2,
                    color: Color(skill.$3),
                    level: skill.$4,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverSkillCard extends StatefulWidget {
  final String icon;
  final String name;
  final Color color;
  final int level;

  const _HoverSkillCard({
    required this.icon,
    required this.name,
    required this.color,
    required this.level,
  });

  @override
  State<_HoverSkillCard> createState() => _HoverSkillCardState();
}

class _HoverSkillCardState extends State<_HoverSkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: _hovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          border: Border.all(
            color: _hovered ? widget.color.withOpacity(0.5) : AppTheme.border,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.icon, style: const TextStyle(fontSize: 36)),
              const SizedBox(height: 12),
              Text(widget.name, style: AppTheme.mono12w500text),
              const SizedBox(height: 12),
              Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.border,
                  borderRadius: BorderRadius.circular(1),
                ),
                child: FractionallySizedBox(
                  widthFactor: widget.level / 100,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}