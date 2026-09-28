import 'package:flutter/material.dart';

class PortfolioNavbar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onServicesTap;
  final VoidCallback onContactTap;
  final VoidCallback onThemeToggle;

  const PortfolioNavbar({
    super.key,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onServicesTap,
    required this.onContactTap,
    required this.onThemeToggle,
  });

  void _openMobileMenu(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .outlineVariant,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 25),

                _MobileMenuItem(
                  icon: Icons.person_outline,
                  title: 'About',
                  onTap: () {
                    Navigator.pop(context);
                    onAboutTap();
                  },
                ),

                _MobileMenuItem(
                  icon: Icons.code_outlined,
                  title: 'Skills',
                  onTap: () {
                    Navigator.pop(context);
                    onSkillsTap();
                  },
                ),

                _MobileMenuItem(
                  icon: Icons.work_outline,
                  title: 'Projects',
                  onTap: () {
                    Navigator.pop(context);
                    onProjectsTap();
                  },
                ),

                _MobileMenuItem(
                  icon: Icons.design_services_outlined,
                  title: 'Services',
                  onTap: () {
                    Navigator.pop(context);
                    onServicesTap();
                  },
                ),

                _MobileMenuItem(
                  icon: Icons.email_outlined,
                  title: 'Contact',
                  onTap: () {
                    Navigator.pop(context);
                    onContactTap();
                  },
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: Icon(
                    isDark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                  ),
                  title: Text(
                    isDark ? 'Light Mode' : 'Dark Mode',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onThemeToggle();
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 15 : 20,
      ),
      child: Row(
        children: [
          // Logo
          Text(
            'U',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(width: 12),

          const Text(
            'UMAIR KHAN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),

          const Spacer(),

          if (!isMobile) ...[
            TextButton(
              onPressed: onAboutTap,
              child: const Text('About'),
            ),
            TextButton(
              onPressed: onSkillsTap,
              child: const Text('Skills'),
            ),
            TextButton(
              onPressed: onProjectsTap,
              child: const Text('Projects'),
            ),
            TextButton(
              onPressed: onServicesTap,
              child: const Text('Services'),
            ),
            TextButton(
              onPressed: onContactTap,
              child: const Text('Contact'),
            ),

            const SizedBox(width: 12),

            IconButton(
              tooltip: isDark ? 'Light Mode' : 'Dark Mode',
              onPressed: onThemeToggle,
              icon: Icon(
                isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              ),
            ),
          ] else ...[
            // Mobile Menu
            IconButton(
              tooltip: 'Menu',
              onPressed: () => _openMobileMenu(context),
              icon: const Icon(
                Icons.menu_rounded,
                size: 28,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: onTap,
    );
  }
}