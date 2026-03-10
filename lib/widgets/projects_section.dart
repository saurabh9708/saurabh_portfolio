import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectData(
        icon: '🛒',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF0a1628), Color(0xFF1a0a2e)],
        ),
        tag: 'Live App',
        title: 'ShopSync — E-Commerce',
        description: 'Full-featured cross-platform marketplace with real-time inventory, Stripe payments, push notifications, and an admin dashboard.',
        technologies: ['Flutter', 'Firebase', 'Stripe', 'FCM', 'Riverpod'],
      ),
      ProjectData(
        icon: '💰',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF001a0a), Color(0xFF0a2010)],
        ),
        tag: 'Fintech',
        title: 'WealthTrack — Finance',
        description: 'Personal finance tracker with real-time bank sync, budget analytics, spending charts, and biometric authentication.',
        technologies: ['Flutter', 'Supabase', 'Plaid API', 'fl_chart'],
      ),
      ProjectData(
        icon: '🍕',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF1a0a00), Color(0xFF2e1500)],
        ),
        tag: 'Mobile',
        title: 'FoodRun — Delivery',
        description: 'Multi-restaurant food delivery app with real-time order tracking, live driver location on maps, and restaurant CMS dashboard.',
        technologies: ['Flutter', 'Firebase', 'Google Maps', 'Bloc'],
      ),
      ProjectData(
        icon: '🎓',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF0a0a1e), Color(0xFF1a0a2e)],
        ),
        tag: 'EdTech',
        title: 'LearnFlow — LMS Platform',
        description: 'Cross-platform learning management system with video courses, quizzes, certificates, progress tracking, and instructor dashboards.',
        technologies: ['Flutter Web', 'Supabase', 'AWS S3', 'Vercel'],
      ),
      ProjectData(
        icon: '🏥',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF001a1a), Color(0xFF0a1e1e)],
        ),
        tag: 'HealthTech',
        title: 'MedBook — Telemedicine',
        description: 'Doctor booking and telemedicine app featuring WebRTC video calls, e-prescriptions, appointment scheduling, and health records.',
        technologies: ['Flutter', 'Firebase', 'WebRTC', 'REST API'],
      ),
      ProjectData(
        icon: '💬',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF1a001a), Color(0xFF2e002e)],
        ),
        tag: 'Social',
        title: 'ChatFlow — Messenger',
        description: 'Real-time chat app with end-to-end encryption, group chats, media sharing, voice messages, and read receipts.',
        technologies: ['Flutter', 'Firebase RTDB', 'FCM', 'AES Encryption'],
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 48),
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
                  Text('FEATURED WORK', style: AppTheme.mono11cyan),
                ],
              ),
              const SizedBox(height: 20),
              Text('Projects that ship', style: AppTheme.syne48w800),
              const SizedBox(height: 16),
              SizedBox(
                width: 560,
                child: Text(
                  'Real products used by real people — built with Flutter, delivered fast.',
                  style: AppTheme.sans16muted,
                ),
              ),
              const SizedBox(height: 64),

              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 0.72,
                ),
                children: projects.map((p) => _HoverProjectCard(project: p)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverProjectCard extends StatefulWidget {
  final ProjectData project;
  const _HoverProjectCard({required this.project});

  @override
  State<_HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<_HoverProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: _hovered ? (Matrix4.identity()..scale(1.02)) : Matrix4.identity(),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          border: Border.all(
            color: _hovered ? AppTheme.cyan.withOpacity(0.4) : AppTheme.border,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: project.bgGradient,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Center(child: Text(project.icon, style: const TextStyle(fontSize: 64))),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppTheme.surface],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.cyan.withOpacity(0.1),
                        border: Border.all(color: AppTheme.cyan.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(project.tag.toUpperCase(), style: AppTheme.mono10cyanTag),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title, style: AppTheme.syne20w700),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(project.description, style: AppTheme.sans14mutedTall),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.technologies
                          .map((tech) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.surface2,
                                  border: Border.all(color: AppTheme.border),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(tech, style: AppTheme.mono10muted),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text('GitHub →', style: AppTheme.mono11cyanLink),
                        const SizedBox(width: 24),
                        Text('Live Demo →', style: AppTheme.mono11mutedLink),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectData {
  final String icon;
  final LinearGradient bgGradient;
  final String tag;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectData({
    required this.icon,
    required this.bgGradient,
    required this.tag,
    required this.title,
    required this.description,
    required this.technologies,
  });
}
