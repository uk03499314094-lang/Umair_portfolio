
import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const List<_ServiceInfo> _services = [
    _ServiceInfo(
      number: '01',
      title: 'Web Development',
      description:
          'Modern, responsive and professional websites built for performance, accessibility and an excellent user experience.',
      icon: Icons.language_rounded,
      technologies: ['React', 'JavaScript', 'Tailwind CSS'],
    ),
    _ServiceInfo(
      number: '02',
      title: 'Flutter Development',
      description:
          'Cross-platform mobile and web applications with clean interfaces, responsive layouts and smooth interactions.',
      icon: Icons.phone_android_rounded,
      technologies: ['Flutter', 'Dart', 'Material 3'],
    ),
    _ServiceInfo(
      number: '03',
      title: 'AI & Machine Learning',
      description:
          'Intelligent solutions using machine learning, computer vision and AI-powered applications to solve real problems.',
      icon: Icons.psychology_alt_rounded,
      technologies: ['Python', 'TensorFlow', 'OpenCV'],
    ),
    _ServiceInfo(
      number: '04',
      title: 'AI Automation',
      description:
          'Automated workflows that connect AI tools, APIs and business processes to reduce repetitive manual work.',
      icon: Icons.auto_awesome_rounded,
      technologies: ['Python', 'n8n', 'APIs'],
    ),
    _ServiceInfo(
      number: '05',
      title: 'Backend & APIs',
      description:
          'Backend functionality and API integrations designed to connect applications, manage data and support business logic.',
      icon: Icons.storage_rounded,
      technologies: ['Node.js', 'Express', 'REST APIs'],
    ),
    
_ServiceInfo(
  number: '06',
  title: 'Database Solutions',
  description:
      'Structured data storage and database integration for reliable, maintainable and scalable applications.',
  icon: Icons.storage_rounded,
  technologies: ['MongoDB', 'SQL', 'Firebase'],
),

_ServiceInfo(
  number: '06',
  title: 'Database Solutions',
  description:
      'Structured data storage and database integration for reliable, maintainable and scalable applications.',
  icon: Icons.storage_rounded,
  technologies: ['MongoDB', 'SQL', 'Firebase'],
),

  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : (width < 1000 ? 34 : 60),
        vertical: isMobile ? 64 : 88,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 3,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'WHAT I DO',
                style: TextStyle(
                  color: primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Services & Expertise',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: isMobile ? 29 : 38,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Building digital experiences and intelligent solutions '
              'with modern technologies.',
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.7,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 34),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 1050
                  ? 3
                  : constraints.maxWidth >= 650
                      ? 2
                      : 1;
              const spacing = 20.0;
              final cardWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) /
                      columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: _services.map((service) {
                  return SizedBox(
                    width: cardWidth,
                    child: _ServiceCard(
                      service: service,
                      primary: primary,
                      isDark: isDark,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceInfo {
  final String number;
  final String title;
  final String description;
  final IconData icon;
  final List<String> technologies;

  const _ServiceInfo({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.technologies,
  });
}

class _ServiceCard extends StatefulWidget {
  final _ServiceInfo service;
  final Color primary;
  final bool isDark;

  const _ServiceCard({
    required this.service,
    required this.primary,
    required this.isDark,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final service = widget.service;
    final primary = widget.primary;
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(
          0,
          _hovered ? -6 : 0,
          0,
        ),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: widget.isDark
              ? const Color(0xFF0B1118)
              : theme.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? primary.withValues(alpha: 0.7)
                : theme.dividerColor.withValues(alpha: 0.65),
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? primary.withValues(alpha: 0.12)
                  : Colors.black.withValues(
                      alpha: widget.isDark ? 0.12 : 0.035,
                    ),
              blurRadius: _hovered ? 28 : 16,
              offset: Offset(0, _hovered ? 12 : 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: primary.withValues(
                      alpha: _hovered ? 0.18 : 0.09,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: primary.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Icon(
                    service.icon,
                    color: primary,
                    size: 27,
                  ),
                ),
                Text(
                  service.number,
                  style: TextStyle(
                    color: primary.withValues(alpha: 0.65),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              service.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              service.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.7,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              color: theme.dividerColor.withValues(alpha: 0.65),
              height: 1,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: service.technologies.map((technology) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: primary.withValues(alpha: 0.18),
                    ),
                  ),
                  child: Text(
                    technology,
                    style: TextStyle(
                      color: primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
