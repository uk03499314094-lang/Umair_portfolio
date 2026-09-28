import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 70,
        vertical: isMobile ? 50 : 80,
      ),
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: _buildContent(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: _buildVisual(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildVisual(context),
        const SizedBox(height: 50),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HELLO, I'M UMAIR 👋",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          'Full-Stack Developer\n& Flutter Developer',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
        ),

        const SizedBox(height: 24),

        Text(
          'I build modern, responsive web and mobile applications '
          'with clean code, thoughtful design, and scalable architecture.',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                height: 1.6,
              ),
        ),

        const SizedBox(height: 35),

        // Main Buttons
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            ElevatedButton.icon(
              onPressed: onProjectsTap,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('View Projects'),
            ),
            OutlinedButton.icon(
              onPressed: onContactTap,
              icon: const Icon(Icons.mail_outline),
              label: const Text('Contact Me'),
            ),
          ],
        ),

        const SizedBox(height: 35),

        // Social Buttons
        Row(
          children: [
            _SocialButton(
              icon: Icons.code,
              label: 'GitHub',
              onPressed: () {
                _openUrl(
                  'https://github.com/uk03499314094-lang',
                );
              },
            ),

            const SizedBox(width: 20),

            _SocialButton(
              icon: Icons.business_center_outlined,
              label: 'LinkedIn',
              onPressed: () {
                _openUrl(
                  'https://www.linkedin.com/in/umair-khan-433605364',
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVisual(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: primary.withValues(alpha: 0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.12),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Image.asset(
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 20,
      ),
      label: Text(label),
    );
  }
}