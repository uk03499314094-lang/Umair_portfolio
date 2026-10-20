import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<_ProjectInfo> _projects = [
    _ProjectInfo(
      number: '01',
      title: 'Emotion Detection AI',
      category: 'AI / MACHINE LEARNING',
      description:
          'An AI-powered emotion classification system designed to recognize human emotions using computer vision and deep learning.',
      technologies: ['Python', 'TensorFlow', 'CNN', 'OpenCV'],
      icon: Icons.psychology_outlined,
      githubUrl: 'https://github.com/uk03499314094-lang/task-2',
      featured: true,
    ),
    _ProjectInfo(
      number: '02',
      title: 'MERN Web Application',
      category: 'FULL-STACK DEVELOPMENT',
      description:
          'A full-stack web application concept using React, Node.js, Express and MongoDB, with a responsive interface and API integration.',
      technologies: ['React', 'Node.js', 'Express', 'MongoDB'],
      icon: Icons.language_rounded,
      githubUrl: 'https://github.com/uk03499314094-lang',
    ),
    _ProjectInfo(
      number: '03',
      title: 'Flutter Portfolio',
      category: 'FLUTTER / WEB',
      description:
          'A responsive personal developer portfolio built with Flutter, featuring modern UI, animations and dark/light theme support.',
      technologies: ['Flutter', 'Dart', 'Material 3', 'Web'],
      icon: Icons.phone_android_rounded,
      githubUrl: 'https://github.com/uk03499314094-lang/Umair_portfolio',
    ),
    _ProjectInfo(
      number: '04',
      title: 'AI Automation',
      category: 'AI / AUTOMATION',
      description:
          'Automation workflow concepts that connect AI tools, APIs and business processes to reduce repetitive tasks and improve productivity.',
      technologies: ['Python', 'n8n', 'AI', 'APIs'],
      icon: Icons.auto_awesome_rounded,
      githubUrl: 'https://github.com/uk03499314094-lang',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1050 ? 2 : 1;
    final horizontalPadding = width < 600 ? 18.0 : (width < 1000 ? 34.0 : 60.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: width < 600 ? 64 : 88,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(context, width),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = (constraints.maxWidth - (columns - 1) * 22) / columns;
              return Wrap(
                spacing: 22,
                runSpacing: 22,
                children: _projects
                    .map(
                      (project) => SizedBox(
                        width: cardWidth,
                        child: _ProjectCard(project: project),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(BuildContext context, double width) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isMobile = width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 2,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'SELECTED WORK',
              style: TextStyle(
                color: primary,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Featured Projects',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: isMobile ? 29 : 36,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A selection of projects built with modern technologies.',
          style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
        ),
      ],
    );
  }
}

class _ProjectInfo {
  final String number;
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String githubUrl;
  final bool featured;

  const _ProjectInfo({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.icon,
    required this.githubUrl,
    this.featured = false,
  });
}

class _ProjectCard extends StatefulWidget {
  final _ProjectInfo project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;
  double _tiltX = 0;
  double _tiltY = 0;

  Future<void> _openGithub() async {
    final uri = Uri.parse(widget.project.githubUrl);
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the GitHub link.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the GitHub link.')),
      );
    }
  }

  void _updateTilt(PointerEvent event, BoxConstraints constraints) {
    if (constraints.maxWidth <= 0 || constraints.maxHeight <= 0) return;
    final x = (event.localPosition.dx / constraints.maxWidth) * 2 - 1;
    final y = (event.localPosition.dy / constraints.maxHeight) * 2 - 1;
    setState(() {
      _tiltY = x.clamp(-1.0, 1.0) * 0.035;
      _tiltX = -y.clamp(-1.0, 1.0) * 0.035;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final project = widget.project;
    final isDark = theme.brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() {
            _hovered = false;
            _tiltX = 0;
            _tiltY = 0;
          }),
          onHover: (event) => _updateTilt(event, constraints),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            transformAlignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0012)
              ..rotateX(_hovered ? _tiltX : 0)
              ..rotateY(_hovered ? _tiltY : 0)
              ..translate(0.0, _hovered ? -5.0 : 0.0),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0B1118) : theme.cardColor,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: _hovered
                    ? primary.withValues(alpha: .65)
                    : (isDark ? const Color(0xFF26313D) : theme.dividerColor),
              ),
              boxShadow: [
                BoxShadow(
                  color: _hovered
                      ? primary.withValues(alpha: .15)
                      : Colors.black.withValues(alpha: isDark ? .14 : .045),
                  blurRadius: _hovered ? 32 : 17,
                  offset: Offset(0, _hovered ? 14 : 7),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProjectVisual(primary, isDark),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      constraints.maxWidth < 380 ? 16 : 22,
                      21,
                      constraints.maxWidth < 380 ? 16 : 22,
                      20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                project.category,
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              project.number,
                              style: TextStyle(
                                color: primary.withValues(alpha: .55),
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 9),
                        Text(
                          project.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 21,
                            color: isDark ? Colors.white : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -.4,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          project.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? const Color(0xFF9AA6B2)
                                : theme.colorScheme.onSurfaceVariant,
                            height: 1.65,
                          ),
                        ),
                        const SizedBox(height: 17),
                        Wrap(
                          spacing: 7,
                          runSpacing: 7,
                          children: project.technologies
                              .map((tech) => _TechChip(text: tech, primary: primary))
                              .toList(),
                        ),
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            Flexible(
                              child: TextButton.icon(
                                onPressed: _openGithub,
                                style: TextButton.styleFrom(
                                  foregroundColor: primary,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 8,
                                  ),
                                ),
                                icon: const Icon(Icons.code_rounded, size: 17),
                                label: const Text(
                                  'VIEW GITHUB',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: .8,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            AnimatedSlide(
                              duration: const Duration(milliseconds: 220),
                              offset: _hovered ? const Offset(.15, 0) : Offset.zero,
                              child: Icon(Icons.arrow_forward_rounded, color: primary, size: 19),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectVisual(Color primary, bool isDark) {
    final project = widget.project;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: project.featured ? 195 : 168,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? const [Color(0xFF101A25), Color(0xFF080D13)]
              : const [Color(0xFFF4F7FA), Color(0xFFE9EEF4)],
        ),
        border: Border(bottom: BorderSide(color: primary.withValues(alpha: .18))),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: -65,
            right: -35,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _hovered ? 220 : 190,
              height: _hovered ? 220 : 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primary.withValues(alpha: _hovered ? .17 : .08),
                  width: 2,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -45,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primary.withValues(alpha: .07), width: 2),
              ),
            ),
          ),
          Center(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 250),
              scale: _hovered ? 1.1 : 1,
              child: Container(
                width: 94,
                height: 94,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: .08),
                  shape: BoxShape.circle,
                  border: Border.all(color: primary.withValues(alpha: .38), width: 1.4),
                  boxShadow: [
                    BoxShadow(
                      color: primary.withValues(alpha: _hovered ? .19 : .07),
                      blurRadius: _hovered ? 38 : 25,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(project.icon, color: primary, size: 43),
              ),
            ),
          ),
          Positioned(
            top: 17,
            left: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: .35),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white.withValues(alpha: .1)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
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

  const _TechChip({required this.text, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: .07),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: primary.withValues(alpha: .18)),
      ),
      child: Text(
        text,
        style: TextStyle(color: primary, fontSize: 9, fontWeight: FontWeight.w700),
      ),
    );
  }
}
