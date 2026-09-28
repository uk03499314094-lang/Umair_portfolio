import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  Future<void> _openResume() async {
    if (kIsWeb) {
      final uri = Uri.base.resolve('assets/resume/cv.pdf');

      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 70,
        vertical: 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Turning ideas into digital experiences.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),

          const SizedBox(height: 45),

          isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: _buildProfileImage(context),
        ),

        const SizedBox(width: 60),

        Expanded(
          flex: 6,
          child: _buildAboutContent(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context),

        const SizedBox(height: 40),

        _buildAboutContent(context),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      height: 430,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: primary.withValues(alpha: 0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.10),
            blurRadius: 30,
            spreadRadius: 3,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Image.asset(
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm Umair Khan.",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),

        const SizedBox(height: 18),

        Text(
          'I am a Computer Science student at the University of '
          'Engineering & Technology Mardan, passionate about software '
          'development, web development and mobile application development.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.8,
              ),
        ),

        const SizedBox(height: 18),

        Text(
          'I work with modern technologies to build responsive web '
          'applications, mobile applications and practical software '
          'solutions. I am also interested in AI, machine learning '
          'and automation.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.8,
              ),
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _InfoChip(
              icon: Icons.school_outlined,
              text: 'Computer Science',
            ),
            _InfoChip(
              icon: Icons.web_outlined,
              text: 'Full Stack Developer',
            ),
            _InfoChip(
              icon: Icons.phone_android_outlined,
              text: 'Flutter Developer',
            ),
            _InfoChip(
              icon: Icons.auto_awesome_outlined,
              text: 'AI & Automation',
            ),
          ],
        ),

        const SizedBox(height: 35),

        ElevatedButton.icon(
          onPressed: () {
            _openResume();
          },
          icon: const Icon(Icons.download_outlined),
          label: const Text('View / Download Resume'),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: primary.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: primary,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}