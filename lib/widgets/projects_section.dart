import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

    final liveDemos = [
      ProjectData(
        icon: '💻',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF0a1628), Color(0xFF1a0a2e)],
        ),
        tag: 'Live Demo',
        title: 'Mini Store',
        description: 'A modern e-commerce storefront for tech accessories. Built with a clean UI, state management, and smooth animations.',
        technologies: ['Flutter', 'Firebase', 'State Management'],
        liveLink: 'https://laptoplux-cfd33.firebaseapp.com/',
      ),
      ProjectData(
        icon: '🖥️',
        bgGradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF001a0a), Color(0xFF0a2010)],
        ),
        tag: 'Live Demo',
        title: 'Laptop Store',
        description: 'A premium laptop retail application featuring detailed product specifications, a shopping cart, and a responsive layout.',
        technologies: ['Flutter', 'UI/UX', 'Responsive Design'],
        liveLink: 'https://laptoplux-cfd33.firebaseapp.com/',
      ),
    ];

    final hPadding = AppTheme.getHorizontalPadding(context);
    final vPadding = AppTheme.getVerticalPadding(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isNarrow = MediaQuery.of(context).size.width < 450;
    final isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width <= 900;

    // Determine aspect ratio based on screen size to prevent overflows
    double childAspectRatio = 0.85; // Default for desktop
    if (isMobile) {
      childAspectRatio = 0.46; // Ultra-safe to prevent sub-pixel overflows (0.51px)
    } else if (isTablet) {
      childAspectRatio = 0.64; // Taller on tablet
    } else if (MediaQuery.of(context).size.width < 1100) {
      childAspectRatio = 0.7; // Adjust for smaller desktops
    }

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
              // Header: Featured Work
              isMobile // Trigger stacked header for all mobile sizes to prevent right overflow
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(width: 28, height: 1, color: AppTheme.cyan),
                            const SizedBox(width: 10),
                            Text('FEATURED WORK', style: AppTheme.mono11cyan),
                          ],
                        ),
                        const SizedBox(height: 16),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Selected Projects', style: AppTheme.syne48w800),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
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
                            Text('Selected Projects', style: AppTheme.syne48w800),
                          ],
                        ),
                        Text('Sorted by relevance →', style: AppTheme.mono12muted),
                      ],
                    ),
              const SizedBox(height: 64),

              // Main Projects Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AppTheme.getGridCrossAxisCount(context, desktop: 3, tablet: 2, mobile: 1),
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  // childAspectRatio: isMobile ? 0.6 : 0.85,
                  childAspectRatio: isMobile ? 0.6 : isTablet ? 0.62 : 0.72,
                ),
                itemBuilder: (context, index) => _HoverProjectCard(project: projects[index]),
              ),

              const SizedBox(height: 100),

              // Live Demos Section
              Row(
                children: [
                  Container(width: 28, height: 1, color: AppTheme.cyan),
                  const SizedBox(width: 10),
                  Text('LIVE DEMOS', style: AppTheme.mono11cyan),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Mini Apps & Prototypes',
                style: AppTheme.syne36w800.copyWith(
                  fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 32),
                ),
              ),
              const SizedBox(height: 48),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: liveDemos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AppTheme.getGridCrossAxisCount(context, desktop: 2, tablet: 2, mobile: 1),
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: isMobile ? 0.56 : 1.1,
                ),
                itemBuilder: (context, index) => _HoverProjectCard(project: liveDemos[index]),
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
    final isMobile = MediaQuery.of(context).size.width < 600;
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
              height: MediaQuery.of(context).size.width < 600 ? 160 : 200,
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
                padding: EdgeInsets.fromLTRB(24, isMobile ? 16 : 20, 24, isMobile ? 16 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title, style: AppTheme.syne20w700, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 10),
                    Text(
                      project.description,
                      style: AppTheme.sans14mutedTall,
                      maxLines: isMobile ? 3 : 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    const Expanded(child: SizedBox.shrink()), // Replaced Spacer with explicit safety
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: project.technologies
                            .map((tech) => Container(
                                  margin: const EdgeInsets.only(right: 6),
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
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text('GitHub →', style: AppTheme.mono11cyanLink.copyWith(color: AppTheme.muted, decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: 24),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              final link = project.liveLink;
                              if (link != null) {
                                final uri = Uri.parse(link);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }
                            },
                            child: Text('Live Demo →', style: project.liveLink != null ? AppTheme.mono11cyanLink : AppTheme.mono11mutedLink),
                          ),
                        ),
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
  final String? liveLink;

  ProjectData({
    required this.icon,
    required this.bgGradient,
    required this.tag,
    required this.title,
    required this.description,
    required this.technologies,
    this.liveLink,
  });
}
