import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 95,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(context),

          const SizedBox(height: 45),

          if (isMobile)
            Column(
              children: [
                _ProjectCard(
                  number: '01',
                  title: 'Emotion Detection AI',
                  category: 'AI / MACHINE LEARNING',
                  description:
                      'An AI-powered emotion classification system built to recognize human emotions using computer vision and deep learning.',
                  technologies: [
                    'Python',
                    'TensorFlow',
                    'CNN',
                    'OpenCV',
                  ],
                  icon: Icons.psychology_outlined,
                  featured: true,
                  githubUrl:
                      'https://github.com/uk03499314094-lang/task-2',
                ),

                const SizedBox(height: 20),

                _ProjectCard(
                  number: '02',
                  title: 'MERN Web Application',
                  category: 'FULL-STACK DEVELOPMENT',
                  description:
                      'A modern full-stack web application using React, Node.js, Express and MongoDB with responsive UI and API integration.',
                  technologies: [
                    'React',
                    'Node.js',
                    'Express',
                    'MongoDB',
                  ],
                  icon: Icons.language_outlined,
                  githubUrl:
                      'https://github.com/uk03499314094-lang',
                ),

                const SizedBox(height: 20),

                _ProjectCard(
                  number: '03',
                  title: 'Flutter Portfolio',
                  category: 'FLUTTER / WEB',
                  description:
                      'A responsive personal developer portfolio built with Flutter featuring modern UI, animations and dark/light themes.',
                  technologies: [
                    'Flutter',
                    'Dart',
                    'Material 3',
                    'Web',
                  ],
                  icon: Icons.phone_android_outlined,
                  githubUrl:
                      'https://github.com/uk03499314094-lang',
                ),

                const SizedBox(height: 20),

                _ProjectCard(
                  number: '04',
                  title: 'AI Automation',
                  category: 'AI / AUTOMATION',
                  description:
                      'Automation workflows combining AI, APIs and business processes to reduce repetitive tasks and improve productivity.',
                  technologies: [
                    'Python',
                    'n8n',
                    'AI',
                    'APIs',
                  ],
                  icon: Icons.auto_awesome_outlined,
                  githubUrl:
                      'https://github.com/uk03499314094-lang',
                ),
              ],
            )
          else
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _ProjectCard(
                        number: '01',
                        title: 'Emotion Detection AI',
                        category: 'AI / MACHINE LEARNING',
                        description:
                            'An AI-powered emotion classification system built to recognize human emotions using computer vision and deep learning.',
                        technologies: [
                          'Python',
                          'TensorFlow',
                          'CNN',
                          'OpenCV',
                        ],
                        icon: Icons.psychology_outlined,
                        featured: true,
                        githubUrl:
                            'https://github.com/uk03499314094-lang/task-2',
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      flex: 2,
                      child: _ProjectCard(
                        number: '02',
                        title: 'MERN Web Application',
                        category: 'FULL-STACK DEVELOPMENT',
                        description:
                            'A modern full-stack web application using React, Node.js, Express and MongoDB.',
                        technologies: [
                          'React',
                          'Node.js',
                          'Express',
                          'MongoDB',
                        ],
                        icon: Icons.language_outlined,
                        githubUrl:
                            'https://github.com/uk03499314094-lang',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ProjectCard(
                        number: '03',
                        title: 'Flutter Portfolio',
                        category: 'FLUTTER / WEB',
                        description:
                            'A responsive personal developer portfolio built with Flutter featuring modern UI, animations and dark/light themes.',
                        technologies: [
                          'Flutter',
                          'Dart',
                          'Material 3',
                          'Web',
                        ],
                        icon: Icons.phone_android_outlined,
                        githubUrl:
                            'https://github.com/uk03499314094-lang',
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: _ProjectCard(
                        number: '04',
                        title: 'AI Automation',
                        category: 'AI / AUTOMATION',
                        description:
                            'Automation workflows combining AI, APIs and business processes to reduce repetitive tasks.',
                        technologies: [
                          'Python',
                          'n8n',
                          'AI',
                          'APIs',
                        ],
                        icon: Icons.auto_awesome_outlined,
                        githubUrl:
                            'https://github.com/uk03499314094-lang',
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
              'SELECTED WORK',
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
          'Featured Projects',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -1,
              ),
        ),

        const SizedBox(height: 8),

        Text(
          'A selection of projects built with modern technologies.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String number;
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final bool featured;
  final String githubUrl;

  const _ProjectCard({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.icon,
    required this.githubUrl,
    this.featured = false,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _openGithub() async {
    final uri = Uri.parse(widget.githubUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    }
  }

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
        duration: const Duration(milliseconds: 280),

        width: double.infinity,

        transform: Matrix4.identity()
          ..translate(
            0.0,
            _hovered ? -7.0 : 0.0,
          ),

        decoration: BoxDecoration(
          color: const Color(0xFF0B1118),

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: _hovered
                ? primary.withValues(alpha: 0.60)
                : const Color(0xFF202B36),
          ),

          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.13),
                    blurRadius: 40,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectVisual(primary),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.category,
                        style: TextStyle(
                          color: primary,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),

                      Text(
                        widget.number,
                        style: TextStyle(
                          color: primary.withValues(alpha: 0.4),
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 11),

                  Text(
                    widget.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF9AA6B2),
                      height: 1.65,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Wrap(
                    spacing: 7,
                    runSpacing: 7,
                    children: widget.technologies
                        .map(
                          (tech) => _TechChip(
                            text: tech,
                            primary: primary,
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 22),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _openGithub,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 8,
                          ),
                          foregroundColor: primary,
                        ),
                        icon: const Icon(
                          Icons.code_rounded,
                          size: 17,
                        ),
                        label: const Text(
                          'VIEW GITHUB',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 250),
                        transform: Matrix4.identity()
                          ..translate(
                            _hovered ? 5.0 : 0.0,
                            0.0,
                          ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectVisual(Color primary) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      height: widget.featured ? 230 : 190,

      width: double.infinity,

      decoration: BoxDecoration(
        color: const Color(0xFF070B10),

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        border: Border(
          bottom: BorderSide(
            color: primary.withValues(
              alpha: _hovered ? 0.25 : 0.10,
            ),
          ),
        ),
      ),

      child: Stack(
        children: [
          Positioned(
            top: -60,
            right: -40,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: _hovered ? 220 : 190,
              height: _hovered ? 220 : 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primary.withValues(alpha: 0.08),
                  width: 2,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -70,
            left: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primary.withValues(alpha: 0.05),
                  width: 2,
                ),
              ),
            ),
          ),

          Center(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: _hovered ? 1.12 : 1.0,

              child: Container(
                width: 95,
                height: 95,

                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.07),
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: primary.withValues(alpha: 0.25),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: primary.withValues(alpha: 0.10),
                      blurRadius: 35,
                    ),
                  ],
                ),

                child: Icon(
                  widget.icon,
                  color: primary,
                  size: 45,
                ),
              ),
            ),
          ),

          Positioned(
            top: 18,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'PROJECT',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String text;
  final Color primary;

  const _TechChip({
    required this.text,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: primary.withValues(alpha: 0.12),
        ),
      ),

      child: Text(
        text,
        style: TextStyle(
          color: primary,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}