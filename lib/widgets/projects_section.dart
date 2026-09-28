import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            'MY PROJECTS',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Things I have built.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 40),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: isMobile ? 1.2 : 1.15,
            children: [
              _ProjectCard(
                icon: Icons.psychology_outlined,
                title: 'Emotion Detection AI',
                description:
                    'An AI and machine learning project that detects human emotions from facial expressions.',
                technologies: 'Python • TensorFlow • CNN',
                onGithub: () {
                  _openUrl(
                    'https://github.com/uk03499314094-lang',
                  );
                },
                onLiveDemo: null,
              ),

              _ProjectCard(
                icon: Icons.shopping_bag_outlined,
                title: 'MERN Web Application',
                description:
                    'A modern full-stack web application with responsive UI and backend API integration.',
                technologies: 'React • Node.js • MongoDB',
                onGithub: () {
                  _openUrl(
                    'https://github.com/uk03499314094-lang',
                  );
                },
                onLiveDemo: null,
              ),

              _ProjectCard(
                icon: Icons.phone_android_outlined,
                title: 'Flutter Portfolio',
                description:
                    'A responsive personal portfolio application built with Flutter and Dart.',
                technologies: 'Flutter • Dart • Material 3',
                onGithub: () {
                  _openUrl(
                    'https://github.com/uk03499314094-lang',
                  );
                },
                onLiveDemo: null,
              ),

              _ProjectCard(
                icon: Icons.auto_awesome_outlined,
                title: 'AI Automation',
                description:
                    'Automation workflows designed to connect AI tools, APIs and business processes.',
                technologies: 'Python • n8n • AI',
                onGithub: () {
                  _openUrl(
                    'https://github.com/uk03499314094-lang',
                  );
                },
                onLiveDemo: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String technologies;
  final VoidCallback onGithub;
  final VoidCallback? onLiveDemo;

  const _ProjectCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.technologies,
    required this.onGithub,
    required this.onLiveDemo,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              icon,
              color: primary,
              size: 30,
            ),
          ),

          const SizedBox(height: 22),

          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
            ),
          ),

          const SizedBox(height: 15),

          Text(
            technologies,
            style: TextStyle(
              color: primary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 18),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              OutlinedButton.icon(
                onPressed: onGithub,
                icon: const Icon(
                  Icons.code,
                  size: 18,
                ),
                label: const Text('GitHub'),
              ),

              if (onLiveDemo != null)
                TextButton.icon(
                  onPressed: onLiveDemo,
                  icon: const Icon(
                    Icons.open_in_new,
                    size: 18,
                  ),
                  label: const Text('Live Demo'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}