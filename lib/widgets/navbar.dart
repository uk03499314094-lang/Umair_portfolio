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
    final primary = Theme.of(context).colorScheme.primary;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0B1118),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    _Logo(primary: primary),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UMAIR KHAN',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Full-Stack Developer',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                _MobileItem(
                  icon: Icons.home_outlined,
                  title: 'Home',
                  onTap: () => Navigator.pop(context),
                ),
                _MobileItem(
                  icon: Icons.person_outline,
                  title: 'About',
                  onTap: () {
                    Navigator.pop(context);
                    onAboutTap();
                  },
                ),
                _MobileItem(
                  icon: Icons.design_services_outlined,
                  title: 'Services',
                  onTap: () {
                    Navigator.pop(context);
                    onServicesTap();
                  },
                ),
                _MobileItem(
                  icon: Icons.code_outlined,
                  title: 'Skills',
                  onTap: () {
                    Navigator.pop(context);
                    onSkillsTap();
                  },
                ),
                _MobileItem(
                  icon: Icons.work_outline,
                  title: 'Projects',
                  onTap: () {
                    Navigator.pop(context);
                    onProjectsTap();
                  },
                ),
                _MobileItem(
                  icon: Icons.mail_outline,
                  title: 'Contact',
                  onTap: () {
                    Navigator.pop(context);
                    onContactTap();
                  },
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      onContactTap();
                    },
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text("LET'S TALK"),
                  ),
                ),

                const SizedBox(height: 10),

                IconButton(
                  onPressed: onThemeToggle,
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 55,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF070B10).withValues(alpha: 0.94),
        border: const Border(
          bottom: BorderSide(
            color: Color(0xFF1B252F),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          _Logo(primary: primary),

          if (!isMobile) ...[
            const SizedBox(width: 12),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UMAIR KHAN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'FULL-STACK • FLUTTER • AI',
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white54,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ],

          const Spacer(),

          if (!isMobile) ...[
            _NavItem(
              title: 'Home',
              active: true,
              onTap: () {},
            ),
            _NavItem(
              title: 'About',
              onTap: onAboutTap,
            ),
            _NavItem(
              title: 'Services',
              onTap: onServicesTap,
            ),
            _NavItem(
              title: 'Skills',
              onTap: onSkillsTap,
            ),
            _NavItem(
              title: 'Projects',
              onTap: onProjectsTap,
            ),
            _NavItem(
              title: 'Contact',
              onTap: onContactTap,
            ),

            const SizedBox(width: 12),

            // Theme toggle
            Container(
              width: 46,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onThemeToggle,
                iconSize: 15,
                icon: const Icon(
                  Icons.dark_mode_outlined,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Let's Talk
            OutlinedButton(
              onPressed: onContactTap,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 11,
                ),
                side: BorderSide(
                  color: primary.withValues(alpha: 0.8),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "LET'S TALK",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: primary,
                  ),
                ],
              ),
            ),
          ] else
            Container(
              decoration: BoxDecoration(
                color: primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: primary.withValues(alpha: 0.20),
                ),
              ),
              child: IconButton(
                onPressed: () => _openMobileMenu(context),
                icon: const Icon(
                  Icons.menu_rounded,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final Color primary;

  const _Logo({
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.30),
            blurRadius: 15,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        'U',
        style: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;

  const _NavItem({
    required this.title,
    required this.onTap,
    this.active = false,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.active || hovered
                    ? primary
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: widget.active || hovered
                  ? primary
                  : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MobileItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
      ),
    );
  }
}