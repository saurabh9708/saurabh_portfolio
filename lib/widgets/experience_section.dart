import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeline = [
      TimelineItem(
        date: '2024 — Present',
        role: 'Senior Flutter Developer',
        company: 'Freelance / Fiverr Pro Seller',
        description: 'Building cross-platform applications for clients across fintech, healthtech, and e-commerce. Delivering end-to-end Flutter solutions from architecture to App Store deployment.',
        skills: ['Flutter', 'Firebase', 'Supabase', 'AWS'],
      ),
      TimelineItem(
        date: '2023 — 2024',
        role: 'Mobile Developer',
        company: 'TechVentures Studio — Remote',
        description: 'Led development of a Flutter-based B2B SaaS platform with 10k+ users. Implemented complex state management, offline sync, and custom animation systems.',
        skills: ['Flutter', 'Bloc', 'GraphQL', 'REST'],
      ),
      TimelineItem(
        date: '2022 — 2023',
        role: 'Flutter Developer Intern → Junior',
        company: 'AppForge Ltd.',
        description: 'Built and maintained multiple client apps. Gained deep experience in Firebase ecosystem, payment integrations, and publishing to Google Play & App Store.',
        skills: ['Flutter', 'Firebase', 'Stripe'],
      ),
      TimelineItem(
        date: '2021',
        role: 'Started Flutter Journey',
        company: 'Self-taught / Open Source',
        description: 'Fell in love with Flutter after building my first cross-platform app. Completed 200+ hours of coursework, built personal projects, and started contributing to open source packages.',
        skills: ['Flutter', 'Dart', 'Open Source'],
      ),
    ];

    final hPadding = AppTheme.getHorizontalPadding(context);
    final vPadding = AppTheme.getVerticalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      color: AppTheme.bg2,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(width: 28, height: 1, color: AppTheme.cyan),
                  const SizedBox(width: 10),
                  Text('JOURNEY', style: AppTheme.mono11cyan),
                ],
              ),
              const SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'The path here',
                  style: AppTheme.syne48w800.copyWith(
                    fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 48),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 560,
                child: Text(
                  'From curious developer to shipping production apps for global clients.',
                  style: AppTheme.sans16muted.copyWith(
                    fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 16, minFactor: 0.9),
                  ),
                ),
              ),
              const SizedBox(height: 64),
              _buildTimeline(context, timeline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, List<TimelineItem> items) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isLast = index == items.length - 1;

        return Padding(
          padding: EdgeInsets.only(
            bottom: isLast ? 0 : 56,
            left: isSmallScreen ? 24 : 48,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Timeline line
              if (!isLast)
                Positioned(
                  left: isSmallScreen ? -24 : -48,
                  top: 40,
                  bottom: -56,
                  width: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppTheme.cyan, AppTheme.cyan.withOpacity(0)],
                      ),
                    ),
                  ),
                ),

              // Timeline dot
              Positioned(
                left: isSmallScreen ? -31 : -55,
                top: 4,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.cyan, width: 2),
                    color: AppTheme.bg,
                  ),
                  child: Center(
                    child: Container(
                      width: 6, height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.cyan,
                      ),
                    ),
                  ),
                ),
              ),

              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.date.toUpperCase(), style: AppTheme.mono11cyan.copyWith(letterSpacing: 0.12)),
                  const SizedBox(height: 8),
                  Text(
                    item.role,
                    style: AppTheme.syne20w700.copyWith(
                      fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 20),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.company, style: AppTheme.sans14muted),
                  const SizedBox(height: 14),
                  Text(
                    item.description,
                    style: AppTheme.sans14mutedTaller.copyWith(
                      fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 14, minFactor: 0.95),
                    ),
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: item.skills
                        .map((skill) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.surface2,
                                border: Border.all(color: AppTheme.border),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(skill, style: AppTheme.mono10muted),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class TimelineItem {
  final String date;
  final String role;
  final String company;
  final String description;
  final List<String> skills;

  TimelineItem({
    required this.date,
    required this.role,
    required this.company,
    required this.description,
    required this.skills,
  });
}
