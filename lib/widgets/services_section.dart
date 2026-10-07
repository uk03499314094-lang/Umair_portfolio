import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(context),

          const SizedBox(height: 45),

          if (isMobile)
            Column(
              children: [
                _ServiceCard(
                  number: '01',
                  icon: Icons.web_outlined,
                  title: 'Web Development',
                  description:
                      'Modern, responsive websites and web applications built with clean architecture and excellent user experience.',
                  technologies: 'React • JavaScript • Tailwind',
                  featured: true,
                ),

                const SizedBox(height: 16),

                _ServiceCard(
                  number: '02',
                  icon: Icons.phone_android_outlined,
                  title: 'Flutter Development',
                  description:
                      'Cross-platform mobile and web applications using Flutter and Dart with modern Material 3 interfaces.',
                  technologies: 'Flutter • Dart • Material 3',
                ),

                const SizedBox(height: 16),

                _ServiceCard(
                  number: '03',
                  icon: Icons.auto_awesome_outlined,
                  title: 'AI & Automation',
                  description:
                      'AI-powered applications and automation workflows that connect tools, APIs and business processes.',
                  technologies: 'Python • AI • n8n',
                ),

                const SizedBox(height: 16),

                _ServiceCard(
                  number: '04',
                  icon: Icons.dns_outlined,
                  title: 'Backend & APIs',
                  description:
                      'Scalable backend systems, REST APIs, authentication and database integration for modern applications.',
                  technologies: 'Node.js • Express • REST',
                ),

                const SizedBox(height: 16),

                _ServiceCard(
                  number: '05',
                  icon: Icons.storage_outlined,
                  title: 'Database Solutions',
                  description:
                      'Reliable data management and database integration for secure and scalable digital applications.',
                  technologies: 'MongoDB • MySQL',
                ),
              ],
            )
          else
            Column(
              children: [
                // FIRST ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _ServiceCard(
                        number: '01',
                        icon: Icons.web_outlined,
                        title: 'Web Development',
                        description:
                            'Modern, responsive websites and web applications built with clean architecture and excellent user experience.',
                        technologies: 'React • JavaScript • Tailwind',
                        featured: true,
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      flex: 2,
                      child: _ServiceCard(
                        number: '02',
                        icon: Icons.phone_android_outlined,
                        title: 'Flutter Development',
                        description:
                            'Cross-platform applications using Flutter and Dart with beautiful responsive interfaces.',
                        technologies: 'Flutter • Dart • Material 3',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // SECOND ROW
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ServiceCard(
                        number: '03',
                        icon: Icons.auto_awesome_outlined,
                        title: 'AI & Automation',
                        description:
                            'AI-powered applications and automation workflows connecting tools, APIs and business processes.',
                        technologies: 'Python • AI • n8n',
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: _ServiceCard(
                        number: '04',
                        icon: Icons.dns_outlined,
                        title: 'Backend & APIs',
                        description:
                            'Scalable backend systems, REST APIs, authentication and database integration.',
                        technologies: 'Node.js • Express • REST',
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: _ServiceCard(
                        number: '05',
                        icon: Icons.storage_outlined,
                        title: 'Database Solutions',
                        description:
                            'Reliable data management and database integration for modern applications.',
                        technologies: 'MongoDB • MySQL',
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 35,
              height: 2,
              color: primary,
            ),
            const SizedBox(width: 10),
            Text(
              'WHAT I DO',
              style: TextStyle(
                color: primary,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          'Services I Provide',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -0.8,
              ),
        ),

        const SizedBox(height: 8),

        Text(
          'Digital solutions designed to turn ideas into useful products.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final String technologies;
  final bool featured;

  const _ServiceCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.technologies,
    this.featured = false,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        width: double.infinity,

        transform: Matrix4.identity()
          ..translate(
            0.0,
            _hovered ? -6.0 : 0.0,
          ),

        padding: const EdgeInsets.all(26),

        decoration: BoxDecoration(
          color: const Color(0xFF0B1118),

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: _hovered
                ? primary.withValues(alpha: 0.55)
                : const Color(0xFF202B36),
            width: 1,
          ),

          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.12),
                    blurRadius: 35,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),

                  width: 52,
                  height: 52,

                  decoration: BoxDecoration(
                    color: _hovered
                        ? primary.withValues(alpha: 0.16)
                        : primary.withValues(alpha: 0.08),

                    borderRadius: BorderRadius.circular(13),

                    border: Border.all(
                      color: primary.withValues(
                        alpha: _hovered ? 0.35 : 0.15,
                      ),
                    ),
                  ),

                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 250),
                    scale: _hovered ? 1.12 : 1.0,
                    child: Icon(
                      widget.icon,
                      color: primary,
                      size: 24,
                    ),
                  ),
                ),

                Text(
                  widget.number,
                  style: TextStyle(
                    color: primary.withValues(
                      alpha: _hovered ? 0.75 : 0.40,
                    ),
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 34),

            // TITLE
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.3,
              ),
            ),

            const SizedBox(height: 11),

            // DESCRIPTION
            Text(
              widget.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF9AA6B2),
                height: 1.65,
              ),
            ),

            const SizedBox(height: 20),

            // TECHNOLOGIES
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7,
              ),

              decoration: BoxDecoration(
                color: primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: primary.withValues(alpha: 0.10),
                ),
              ),

              child: Text(
                widget.technologies,
                style: TextStyle(
                  color: primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BOTTOM LINE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _hovered ? 1 : 0.55,

                  child: Row(
                    children: [
                      Text(
                        'EXPLORE',
                        style: TextStyle(
                          color: primary,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(width: 8),

                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),

                        transform: Matrix4.identity()
                          ..translate(
                            _hovered ? 5.0 : 0.0,
                            0.0,
                          ),

                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ),

                if (widget.featured)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'FEATURED',
                      style: TextStyle(
                        color: primary,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}