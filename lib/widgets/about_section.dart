import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 900;

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
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Turning ideas into\nstunning realities',
                    style: AppTheme.syne48w800.copyWith(
                      fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 48),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 64),

              // Content grid
              isLargeScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildAboutText(context)),
                        const SizedBox(width: 80),
                        Expanded(child: _buildAboutVisual(context)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildAboutText(context),
                        const SizedBox(height: 48),
                        _buildAboutVisual(context),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I\'m Saurabh, a Flutter Developer with a passion for building cross-platform applications that feel native on every device. I specialize in crafting smooth, beautiful, and highly performant mobile and web experiences.',
          style: AppTheme.sans15muted.copyWith(
            fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 15, minFactor: 0.9),
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: AppTheme.sans15muted.copyWith(
              fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 15, minFactor: 0.9),
            ),
            children: [
              const TextSpan(text: 'My approach combines '),
              TextSpan(
                text: 'clean architecture',
                style: AppTheme.sans15textBold.copyWith(
                  fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 15, minFactor: 0.9),
                ),
              ),
              const TextSpan(
                text: ', thoughtful UX design, and modern state management patterns. Whether it\'s a complex fintech app or a consumer product with millions of users, I bring the same level of care and craftsmanship to every project.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'When I\'m not writing Dart, I\'m exploring new rendering techniques, contributing to open source, and staying ahead of the Flutter ecosystem.',
          style: AppTheme.sans15muted.copyWith(
            fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 15, minFactor: 0.9),
          ),
        ),
        const SizedBox(height: 36),

        // Stats grid
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 480 ? 2 : 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: MediaQuery.of(context).size.width > 480 ? 1 : 1.4,
          ),
          children: [
            _buildStatCard(context, '3+', 'Years building Flutter'),
            _buildStatCard(context, '8+', 'Apps delivered'),
            _buildStatCard(context, '5',  'Happy clients'),
            _buildStatCard(context, '98%', 'Client satisfaction'),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutVisual(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.surface2,
                border: Border.all(color: AppTheme.border),
                borderRadius: BorderRadius.circular(24),
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
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
                        width: AppTheme.getResponsiveFontSize(context, baseSize: 100),
                        height: AppTheme.getResponsiveFontSize(context, baseSize: 100),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.cyan.withOpacity(0.3), width: 3),
                          gradient: AppTheme.cyanPurpleGradient,
                        ),
                        child: Center(
                          child: Text(
                            'SG',
                            style: AppTheme.syne48w800bg.copyWith(
                              fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 40),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Saurabh',
                        style: AppTheme.syne20w700.copyWith(
                          fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 20),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Flutter Developer', style: AppTheme.mono12mutedPlain),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Floating badges
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildFloatingBadge('📱 Flutter 3.x Expert'),
                _buildFloatingBadge('🚀 50k+ App Downloads'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String number, String label) {
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
            child: Text(
              number,
              style: AppTheme.syne36w800.copyWith(
                fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 36),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center, style: AppTheme.mono11mutedSm),
        ],
      ),
    );
  }

  Widget _buildFloatingBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.bg.withOpacity(0.9),
        border: Border.all(color: AppTheme.border2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: AppTheme.mono10cyan),
    );
  }
}
