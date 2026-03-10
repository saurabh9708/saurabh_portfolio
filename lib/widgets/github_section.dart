import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class GitHubSection extends StatelessWidget {
  const GitHubSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 48),
      color: AppTheme.bg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(width: 28, height: 1, color: AppTheme.cyan),
                          const SizedBox(width: 10),
                          Text('OPEN SOURCE', style: AppTheme.mono11cyan),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('GitHub Activity', style: AppTheme.syne48w800),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final uri = Uri.parse('https://github.com/saurabh9708');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.border),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text('View Profile →', style: AppTheme.mono12mutedLink),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Stats grid
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                children: [
                  _buildGithubStat('847', 'contributions this year'),
                  _buildGithubStat('38', 'public repositories'),
                  _buildGithubStat('214', 'total stars earned'),
                  _buildGithubStat('56', 'pull requests merged'),
                ],
              ),

              const SizedBox(height: 32),

              // Contribution graph
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.border),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('847 contributions in the last year', style: AppTheme.mono12mutedLink),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(52, (week) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Column(
                              children: List.generate(7, (day) {
                                final level = ((week + day) % 5);
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Container(
                                    width: 11,
                                    height: 11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: _getContributionColor(level),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Pinned repos
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                children: [
                  _buildPinnedRepo('📦 flutter_clean_arch_starter',
                    'Production-ready Flutter starter with clean architecture, Riverpod, GoRouter, and full test coverage.', 'Dart', 89, 34),
                  _buildPinnedRepo('🔥 supabase_flutter_kit',
                    'A comprehensive kit for integrating Supabase with Flutter apps — auth, storage, real-time, and edge functions.', 'Dart', 62, 18),
                  _buildPinnedRepo('🎨 flutter_ui_components',
                    'Collection of beautiful, reusable Flutter widgets with smooth animations and full customizability.', 'Dart', 43, 12),
                  _buildPinnedRepo('⚡ riverpod_gen_snippets',
                    'VS Code snippet pack for Riverpod code generation — speeds up Flutter development significantly.', 'JSON', 20, 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGithubStat(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: AppTheme.syne36w800.copyWith(color: AppTheme.cyan)),
          const SizedBox(height: 6),
          Text(label, style: AppTheme.mono12mutedPlain.copyWith(fontSize: 12, letterSpacing: 0.05)),
        ],
      ),
    );
  }

  Widget _buildPinnedRepo(String name, String description, String language, int stars, int forks) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTheme.mono13cyanLink),
          const SizedBox(height: 8),
          Expanded(child: Text(description, style: AppTheme.sans13muted)),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 8, height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: language == 'Dart' ? const Color(0xFF54C5F8) : const Color(0xFF007ACC),
                ),
              ),
              const SizedBox(width: 5),
              Text(language, style: AppTheme.mono11muted.copyWith(fontSize: 11)),
              const SizedBox(width: 16),
              Text('⭐ $stars', style: AppTheme.mono11muted.copyWith(fontSize: 11)),
              const SizedBox(width: 16),
              Text('🍴 $forks', style: AppTheme.mono11muted.copyWith(fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Color _getContributionColor(int level) {
    switch (level) {
      case 1: return AppTheme.cyan.withOpacity(0.2);
      case 2: return AppTheme.cyan.withOpacity(0.4);
      case 3: return AppTheme.cyan.withOpacity(0.65);
      case 4: return AppTheme.cyan;
      default: return AppTheme.border;
    }
  }
}
