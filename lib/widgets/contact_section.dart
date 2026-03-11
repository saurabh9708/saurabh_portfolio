import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _projectTypeController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _projectTypeController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message sent! Thanks for reaching out.')),
    );
    _nameController.clear();
    _emailController.clear();
    _projectTypeController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppTheme.getVerticalPadding(context),
        horizontal: AppTheme.getHorizontalPadding(context),
      ),
      color: AppTheme.bg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section label
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 28, height: 1, color: AppTheme.cyan),
                  const SizedBox(width: 10),
                  Text('LET\'S BUILD', style: AppTheme.mono11cyan),
                  const SizedBox(width: 10),
                  Container(width: 28, height: 1, color: AppTheme.cyan),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                'Have a project in mind?',
                style: AppTheme.syne48w800.copyWith(letterSpacing: -0.02),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              Text(
                'Whether it\'s a startup MVP, a complex enterprise app MVVM, or a beautiful consumer product — let\'s make it real.',
                textAlign: TextAlign.center,
                style: AppTheme.sans16muted,
              ),
              const SizedBox(height: 36),

              // Email link
              FittedBox(
                fit: BoxFit.scaleDown,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    'Sg1377047@gmail.com',
                    style: GoogleFonts.syne(
                      fontSize: AppTheme.getResponsiveFontSize(context, baseSize: 36),
                      fontWeight: FontWeight.w800,
                      foreground: Paint()
                        ..shader = AppTheme.cyanPurpleGradient.createShader(
                          const Rect.fromLTWH(0, 0, 300, 100),
                        ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Form
              Column(
                children: [
                  isLargeScreen
                      ? Row(
                          children: [
                            Expanded(child: _buildFormGroup(label: 'Name', placeholder: 'Your name', controller: _nameController)),
                            const SizedBox(width: 16),
                            Expanded(child: _buildFormGroup(label: 'Email', placeholder: 'your@email.com', controller: _emailController)),
                          ],
                        )
                      : Column(
                          children: [
                            _buildFormGroup(label: 'Name', placeholder: 'Your name', controller: _nameController),
                            const SizedBox(height: 16),
                            _buildFormGroup(label: 'Email', placeholder: 'your@email.com', controller: _emailController),
                          ],
                        ),
                  const SizedBox(height: 16),
                  _buildFormGroup(label: 'Project Type', placeholder: 'e.g. E-commerce app, MVP, Web Dashboard...', controller: _projectTypeController),
                  const SizedBox(height: 16),
                  _buildFormGroup(label: 'Message', placeholder: 'Tell me about your project — goals, timeline, and budget...', controller: _messageController, isTextarea: true),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.cyan.withOpacity(0.15),
                        side: const BorderSide(color: AppTheme.border2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text('Send Message →', style: AppTheme.mono13cyan),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // Social links
              Column(
                children: [
                  Text('Or reach out on', style: AppTheme.sans14muted),
                  const SizedBox(height: 16),
                  isLargeScreen
                      ? Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 12,
                          children: [
                            _HoverSocialButton(platform: 'GitHub', url: 'https://github.com/saurabh9708'),
                            _HoverSocialButton(platform: 'LinkedIn', url: 'https://www.linkedin.com/in/saurabh-java-developer/'),
                            _HoverSocialButton(platform: 'Fiverr', url: 'https://www.fiverr.com/s/Q7qme86'),
                            _HoverSocialButton(platform: 'Upwork', url: 'https://www.upwork.com/freelancers/~017506cb1a548daf69?mp_source=share'),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _HoverSocialButton(platform: 'GitHub', url: 'https://github.com/saurabh9708'),
                            const SizedBox(height: 12),
                            _HoverSocialButton(platform: 'LinkedIn', url: 'https://www.linkedin.com/in/saurabh-java-developer/'),
                            const SizedBox(height: 12),
                            _HoverSocialButton(platform: 'Fiverr', url: 'https://www.fiverr.com/s/Q7qme86'),
                            const SizedBox(height: 12),
                            _HoverSocialButton(platform: 'Upwork', url: 'https://www.upwork.com/freelancers/~017506cb1a548daf69?mp_source=share'),
                          ],
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final _hintStyle = GoogleFonts.instrumentSans(
    fontSize: 14,
    color: AppTheme.muted.withOpacity(0.5),
  );

  Widget _buildFormGroup({
    required String label,
    required String placeholder,
    required TextEditingController controller,
    bool isTextarea = false,
  }) {
    final decoration = InputDecoration(
      hintText: placeholder,
      hintStyle: _hintStyle,
      filled: true,
      fillColor: AppTheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppTheme.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppTheme.cyan.withOpacity(0.4)),
      ),
      contentPadding: const EdgeInsets.all(16),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTheme.mono11muted),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: isTextarea ? 5 : 1,
          decoration: decoration,
          style: AppTheme.sans14textColor,
        ),
      ],
    );
  }
}

class _HoverSocialButton extends StatefulWidget {
  final String platform;
  final String url;
  const _HoverSocialButton({required this.platform, required this.url});

  @override
  State<_HoverSocialButton> createState() => _HoverSocialButtonState();
}

class _HoverSocialButtonState extends State<_HoverSocialButton> {
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.cyan.withOpacity(0.08) : Colors.transparent,
            border: Border.all(
              color: _hovered ? AppTheme.cyan.withOpacity(0.4) : AppTheme.border,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.platform,
                style: _hovered ? AppTheme.mono12cyan : AppTheme.mono12mutedLink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
