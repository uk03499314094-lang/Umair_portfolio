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
        vertical: 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MY SKILLS',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Technologies & tools I work with.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 45),

          _SkillCategory(
            title: 'Frontend Development',
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

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'Backend Development',
            icon: Icons.dns_outlined,
            skills: const [
              'Node.js',
              'Express.js',
              'REST APIs',
              'JSON',
              'AJAX',
            ],
          ),

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'Programming',
            icon: Icons.code_outlined,
            skills: const [
              'JavaScript',
              'Python',
              'C',
              'Java',
              'Dart',
            ],
          ),

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'Mobile Development',
            icon: Icons.phone_android_outlined,
            skills: const [
              'Flutter',
              'Dart',
              'Android Studio',
            ],
          ),

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'Databases',
            icon: Icons.storage_outlined,
            skills: const [
              'MongoDB',
              'MySQL',
              'Basic MongoDB Concepts',
            ],
          ),

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'Tools & Development',
            icon: Icons.build_outlined,
            skills: const [
              'Git',
              'GitHub',
              'VS Code',
              'GitHub Copilot',
            ],
          ),

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'Networking & Systems',
            icon: Icons.lan_outlined,
            skills: const [
              'Computer Networks',
              'Operating Systems',
              'IPv4',
              'IPv6',
            ],
          ),

          const SizedBox(height: 25),

          _SkillCategory(
            title: 'AI & Machine Learning',
            icon: Icons.auto_awesome_outlined,
            skills: const [
              'AI & Machine Learning',
              'AI in Network Management',
              'Automation',
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: primary,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primary.withValues(alpha: 0.18),
                  ),
                  color: primary.withValues(alpha: 0.06),
                ),
                child: Text(
                  skill,
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}