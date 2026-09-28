import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

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
            'MY SERVICES',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'What I can build for you.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 45),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: isMobile ? 2.0 : 1.05,
            children: const [
              _ServiceCard(
                icon: Icons.web_outlined,
                title: 'Web Development',
                description:
                    'Responsive and modern websites using HTML, CSS, JavaScript, React.js and modern UI technologies.',
              ),
              _ServiceCard(
                icon: Icons.phone_android_outlined,
                title: 'Flutter Development',
                description:
                    'Cross-platform mobile and web applications using Flutter and Dart.',
              ),
              _ServiceCard(
                icon: Icons.dns_outlined,
                title: 'Backend & APIs',
                description:
                    'Backend applications, REST APIs, authentication and database integration using Node.js and Express.js.',
              ),
              _ServiceCard(
                icon: Icons.storage_outlined,
                title: 'Database Solutions',
                description:
                    'Database integration and data management using MongoDB and MySQL.',
              ),
              _ServiceCard(
                icon: Icons.auto_awesome_outlined,
                title: 'AI & Automation',
                description:
                    'AI-powered applications and automation workflows using Python and modern AI technologies.',
              ),
              _ServiceCard(
                icon: Icons.integration_instructions_outlined,
                title: 'API Integration',
                description:
                    'Third-party API integration, JSON data handling and connecting different services.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: primary,
              size: 28,
            ),
          ),

          const SizedBox(height: 22),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
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
        ],
      ),
    );
  }
}