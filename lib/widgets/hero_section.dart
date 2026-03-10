import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onExploreWork;
  final VoidCallback? onAboutMe;

  const HeroSection({Key? key, this.onExploreWork, this.onAboutMe}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenHeight),
      child: Container(
        width: double.infinity,
        color: AppTheme.bg,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Lightweight background orbs (no expensive box shadows)
            _buildOrb(top: -200, left: -150, size: 500, color: AppTheme.blue.withOpacity(0.12)),
            _buildOrb(bottom: -150, right: -100, size: 400, color: AppTheme.purple.withOpacity(0.12)),
            _buildOrb(top: 100, right: 100, size: 300, color: AppTheme.cyan.withOpacity(0.08)),

            // Lightweight grid overlay using CustomPaint
            Positioned.fill(
              child: CustomPaint(
                painter: _GridPainter(color: AppTheme.cyan.withOpacity(0.03)),
                willChange: false,
              ),
            ),

            // Radial vignette
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.8,
                    colors: [Colors.transparent, AppTheme.bg],
                  ),
                ),
              ),
            ),

            // Main content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.getHorizontalPadding(context),
                vertical: AppTheme.getVerticalPadding(context),
              ),
              child: FadeTransition(
                opacity: CurvedAnimation(parent: _controller, curve: Curves.easeOut),
                child: SlideTransition(
                  position: Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
                      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.cyan.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(100),
                          color: AppTheme.cyan.withOpacity(0.06),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Available for Projects',
                              style: AppTheme.mono11cyan.copyWith(
                                fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 11, minFactor: 0.9),
                                letterSpacing: 0.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),

                      // Headline
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          children: [
                            Text(
                              'Building the',
                              style: AppTheme.syne80w800.copyWith(
                                fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 80),
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) => AppTheme.cyanPurpleGradient.createShader(bounds),
                              child: Text(
                                'Future of',
                                style: AppTheme.syne80w800.copyWith(
                                  fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 80),
                                ),
                              ),
                            ),
                            Text(
                              'Mobile & Web',
                              style: AppTheme.syne80w800.copyWith(
                                fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 80),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Subtitle
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: Text(
                          'Flutter Developer crafting pixel-perfect cross-platform apps with beautiful UX, clean architecture, and real-world impact.',
                          textAlign: TextAlign.center,
                          style: AppTheme.sans16muted.copyWith(
                            fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 16, minFactor: 0.9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Action buttons
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          ElevatedButton(
                            onPressed: widget.onExploreWork,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.cyan,
                              foregroundColor: AppTheme.bg,
                              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              elevation: 0,
                            ),
                            child: Text('Explore My Work →', style: AppTheme.mono13w500),
                          ),
                          OutlinedButton(
                            onPressed: widget.onAboutMe,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppTheme.border, width: 1),
                              foregroundColor: AppTheme.textColor,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text('About Me', style: AppTheme.mono13w500.copyWith(fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),

                      // Social links
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 28,
                        runSpacing: 12,
                        children: [
                          _HoverSocialLink(text: 'GitHub', url: 'https://github.com/saurabh9708'),
                          Container(width: 1, height: 16, color: AppTheme.border),
                          _HoverSocialLink(text: 'LinkedIn', url: 'https://www.linkedin.com/in/saurabh-java-developer/'),
                          Container(width: 1, height: 16, color: AppTheme.border),
                          _HoverSocialLink(text: 'Fiverr', url: 'https://www.fiverr.com/s/Q7qme86'),
                          Container(width: 1, height: 16, color: AppTheme.border),
                          _HoverSocialLink(text: 'Upwork', url: 'https://www.upwork.com/freelancers/~017506cb1a548daf69?mp_source=share'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrb({double? top, double? bottom, double? left, double? right, required double size, required Color color}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

/// Lightweight grid painter — replaces the expensive 1000x1000 ImageProvider
class _GridPainter extends CustomPainter {
  final Color color;
  const _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;
    const spacing = 60.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.color != color;
}

class _HoverSocialLink extends StatefulWidget {
  final String text;
  final String url;
  const _HoverSocialLink({required this.text, required this.url});

  @override
  State<_HoverSocialLink> createState() => _HoverSocialLinkState();
}

class _HoverSocialLinkState extends State<_HoverSocialLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(widget.url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: _hovered ? AppTheme.mono12cyan : AppTheme.mono12mutedLink,
          child: Text(widget.text),
        ),
      ),
    );
  }
}
