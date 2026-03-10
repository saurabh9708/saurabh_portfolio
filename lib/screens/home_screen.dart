import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/github_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isNavbarScrolled = false;

  // GlobalKeys for each section
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _githubKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    bool shouldShowBackground = _scrollController.offset > 60;
    if (shouldShowBackground != _isNavbarScrolled) {
      setState(() {
        _isNavbarScrolled = shouldShowBackground;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  onExploreWork: () => _scrollToSection(_projectsKey),
                  onAboutMe: () => _scrollToSection(_aboutKey),
                ),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                ProjectsSection(key: _projectsKey),
                GitHubSection(key: _githubKey),
                ExperienceSection(key: _journeyKey),
                ContactSection(key: _contactKey),
                const SizedBox(height: 40),
                const Footer(),
              ],
            ),
          ),
          // Fixed navbar
          Navbar(
            isScrolled: _isNavbarScrolled,
            scrollController: _scrollController,
            onNavTap: (section) {
              switch (section) {
                case 'About':
                  _scrollToSection(_aboutKey);
                  break;
                case 'Skills':
                  _scrollToSection(_skillsKey);
                  break;
                case 'Projects':
                  _scrollToSection(_projectsKey);
                  break;
                case 'GitHub':
                  _scrollToSection(_githubKey);
                  break;
                case 'Journey':
                  _scrollToSection(_journeyKey);
                  break;
                case 'Contact':
                  _scrollToSection(_contactKey);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
