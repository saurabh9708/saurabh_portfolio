import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 48),
      color: AppTheme.bg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Section label
              Row(
                children: [
                  Container(width: 28, height: 1, color: AppTheme.cyan),
                  const SizedBox(width: 10),
                  Text('WHO I AM', style: AppTheme.mono11cyan),
                ],
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                'Turning ideas into\nstunning realities',
                style: AppTheme.syne48w800,
              ),
              const SizedBox(height: 64),

              // Content grid
              isLargeScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildAboutText()),
                        const SizedBox(width: 80),
                        Expanded(child: _buildAboutVisual()),
                      ],
                    )
                  : Column(
                      children: [
                        _buildAboutText(),
                        const SizedBox(height: 48),
                        _buildAboutVisual(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I\'m Saurabh, a Flutter Developer with a passion for building cross-platform applications that feel native on every device. I specialize in crafting smooth, beautiful, and highly performant mobile and web experiences.',
          style: AppTheme.sans15muted,
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: AppTheme.sans15muted,
            children: [
              const TextSpan(text: 'My approach combines '),
              TextSpan(text: 'clean architecture', style: AppTheme.sans15textBold),
              const TextSpan(
                text: ', thoughtful UX design, and modern state management patterns. Whether it\'s a complex fintech app or a consumer product with millions of users, I bring the same level of care and craftsmanship to every project.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'When I\'m not writing Dart, I\'m exploring new rendering techniques, contributing to open source, and staying ahead of the Flutter ecosystem.',
          style: AppTheme.sans15muted,
        ),
        const SizedBox(height: 36),

        // Stats grid
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          children: [
            _buildStatCard('3+', 'Years building Flutter'),
            _buildStatCard('40+', 'Apps delivered'),
            _buildStatCard('12', 'Happy clients'),
            _buildStatCard('98%', 'Client satisfaction'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppTheme.cyanPurpleGradient.createShader(bounds),
            child: Text(number, style: AppTheme.syne36w800),
          ),
          const SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center, style: AppTheme.mono11mutedSm),
        ],
      ),
    );
  }

  Widget _buildAboutVisual() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surface2,
            border: Border.all(color: AppTheme.border),
            borderRadius: BorderRadius.circular(24),
          ),
          child: AspectRatio(
            aspectRatio: 0.75,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF4f8ef7).withOpacity(0.08),
                    const Color(0xFF8b5cf6).withOpacity(0.08),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.cyan.withOpacity(0.3), width: 3),
                      gradient: AppTheme.cyanPurpleGradient,
                    ),
                    child: Center(
                      child: Text('SG', style: AppTheme.syne48w800bg),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Saurabh', style: AppTheme.syne20w700),
                  const SizedBox(height: 4),
                  Text('Flutter Developer', style: AppTheme.mono12mutedPlain),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Floating badges
        Row(
          children: [
            _buildFloatingBadge('📱 Flutter 3.x Expert'),
            const SizedBox(width: 16),
            _buildFloatingBadge('🚀 50k+ App Downloads'),
          ],
        ),
      ],
    );
  }

  Widget _buildFloatingBadge(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.bg.withOpacity(0.9),
          border: Border.all(color: AppTheme.border2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: AppTheme.mono10cyan),
      ),
    );
  }
}
