import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 70,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 45),

          _SkillCategory(
            title: 'Frontend Development',
            subtitle: 'Building modern and responsive user interfaces',
            icon: Icons.web_outlined,
            skills: const [
              'HTML',
              'CSS',
              'JavaScript',
              'React.js',
              'Tailwind CSS',
              'Bootstrap',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'Backend Development',
            subtitle: 'APIs, server-side applications and integrations',
            icon: Icons.dns_outlined,
            skills: const [
              'Node.js',
              'Express.js',
              'REST APIs',
              'JSON',
              'AJAX',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'Programming',
            subtitle: 'Languages used for software development',
            icon: Icons.code_rounded,
            skills: const [
              'JavaScript',
              'Python',
              'C',
              'Java',
              'Dart',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'Mobile Development',
            subtitle: 'Cross-platform applications with Flutter',
            icon: Icons.phone_android_outlined,
            skills: const [
              'Flutter',
              'Dart',
              'Android Studio',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'Databases',
            subtitle: 'Working with structured and NoSQL data',
            icon: Icons.storage_outlined,
            skills: const [
              'MongoDB',
              'MySQL',
              'Database Design',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'Tools & Development',
            subtitle: 'Tools I use for development and collaboration',
            icon: Icons.build_outlined,
            skills: const [
              'Git',
              'GitHub',
              'VS Code',
              'GitHub Copilot',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'Networking & Systems',
            subtitle: 'Fundamentals of systems and computer networks',
            icon: Icons.lan_outlined,
            skills: const [
              'Computer Networks',
              'Operating Systems',
              'IPv4',
              'IPv6',
            ],
          ),

          const SizedBox(height: 20),

          _SkillCategory(
            title: 'AI & Automation',
            subtitle: 'AI, machine learning and workflow automation',
            icon: Icons.auto_awesome_outlined,
            skills: const [
              'AI & Machine Learning',
              'Python Automation',
              'n8n',
              'AI APIs',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 35,
              height: 2,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'MY SKILLS',
              style: TextStyle(
                color: primary,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Technologies & tools I work with.',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'A practical collection of technologies I use to build '
          'web, mobile and AI-powered applications.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
        ),
      ],
    );
  }
}

class _SkillCategory extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.skills,
  });

  @override
  State<_SkillCategory> createState() => _SkillCategoryState();
}

class _SkillCategoryState extends State<_SkillCategory> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
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
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _hovered
                ? primary.withValues(alpha: 0.35)
                : theme.colorScheme.outlineVariant,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.08),
                    blurRadius: 25,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: primary.withValues(
                      alpha: _hovered ? 0.16 : 0.10,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    widget.icon,
                    color: primary,
                    size: 25,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                if (MediaQuery.of(context).size.width >= 600)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      '${widget.skills.length} Skills',
                      style: TextStyle(
                        color: primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.skills.map((skill) {
                return _SkillBadge(
                  skill: skill,
                  primary: primary,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillBadge extends StatelessWidget {
  final String skill;
  final Color primary;

  const _SkillBadge({
    required this.skill,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: primary.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            skill,
            style: TextStyle(
              color: primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}