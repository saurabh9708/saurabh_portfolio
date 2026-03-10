import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class Navbar extends StatelessWidget {
  final bool isScrolled;
  final ScrollController scrollController;
  final Function(String) onNavTap;

  const Navbar({
    Key? key,
    required this.isScrolled,
    required this.scrollController,
    required this.onNavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      decoration: BoxDecoration(
        color: isScrolled ? AppTheme.bg.withOpacity(0.85) : Colors.transparent,
        border: isScrolled
            ? const Border(bottom: BorderSide(color: AppTheme.border, width: 1))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text('SG.dev', style: AppTheme.mono14cyan),

          // Navigation links (hidden on mobile/small screens)
          if (MediaQuery.of(context).size.width > 900)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavLink(text: 'About', onTap: () => onNavTap('About')),
                const SizedBox(width: 36),
                _NavLink(text: 'Skills', onTap: () => onNavTap('Skills')),
                const SizedBox(width: 36),
                _NavLink(text: 'Projects', onTap: () => onNavTap('Projects')),
                const SizedBox(width: 36),
                _NavLink(text: 'GitHub', onTap: () => onNavTap('GitHub')),
                const SizedBox(width: 36),
                _NavLink(text: 'Journey', onTap: () => onNavTap('Journey')),
                const SizedBox(width: 36),
                _NavLink(text: 'Contact', onTap: () => onNavTap('Contact')),
              ],
            ),

          // CTA button
          _HireButton(onTap: () => onNavTap('Contact')),
        ],
      ),
    );
  }
}

/// Nav link with hover color animation
class _NavLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const _NavLink({required this.text, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: _isHovered ? AppTheme.mono12cyan : AppTheme.mono12muted,
          child: Text(widget.text.toUpperCase()),
        ),
      ),
    );
  }
}

/// Hire Me button with hover glow effect
class _HireButton extends StatefulWidget {
  final VoidCallback onTap;
  const _HireButton({required this.onTap});

  @override
  State<_HireButton> createState() => _HireButtonState();
}

class _HireButtonState extends State<_HireButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isHovered ? AppTheme.cyan.withOpacity(0.12) : Colors.transparent,
          side: BorderSide(
            color: _isHovered ? AppTheme.cyan : AppTheme.cyan.withOpacity(0.6),
            width: 1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text('Hire Me', style: AppTheme.mono12cyan),
      ),
    );
  }
}
