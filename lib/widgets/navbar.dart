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
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF0B1118),
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  _Logo(primary: primary, size: 42),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UMAIR KHAN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Full-Stack • Flutter • AI',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close menu',
                    onPressed: () => Navigator.pop(sheetContext),
                    icon: const Icon(Icons.close_rounded, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _MobileItem(
                icon: Icons.home_outlined,
                title: 'Home',
                onTap: () => Navigator.pop(sheetContext),
              ),
              _MobileItem(
                icon: Icons.person_outline_rounded,
                title: 'About',
                onTap: () {
                  Navigator.pop(sheetContext);
                  onAboutTap();
                },
              ),
              _MobileItem(
                icon: Icons.design_services_outlined,
                title: 'Services',
                onTap: () {
                  Navigator.pop(sheetContext);
                  onServicesTap();
                },
              ),
              _MobileItem(
                icon: Icons.code_rounded,
                title: 'Skills',
                onTap: () {
                  Navigator.pop(sheetContext);
                  onSkillsTap();
                },
              ),
              _MobileItem(
                icon: Icons.work_outline_rounded,
                title: 'Projects',
                onTap: () {
                  Navigator.pop(sheetContext);
                  onProjectsTap();
                },
              ),
              _MobileItem(
                icon: Icons.mail_outline_rounded,
                title: 'Contact',
                onTap: () {
                  Navigator.pop(sheetContext);
                  onContactTap();
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(sheetContext);
                    onContactTap();
                  },
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text("LET'S TALK"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                tooltip: 'Toggle theme',
                onPressed: onThemeToggle,
                icon: const Icon(Icons.dark_mode_outlined, color: Colors.white70),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 850;
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 55,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF070B10).withValues(alpha: 0.96),
        border: const Border(
          bottom: BorderSide(color: Color(0xFF1B252F), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _Logo(primary: primary, size: 38),
          if (!isMobile) ...[
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UMAIR KHAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'FULL-STACK • FLUTTER • AI',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 8,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ],
          const Spacer(),
          if (!isMobile) ...[
            _NavItem(title: 'Home', active: true, onTap: () {}),
            _NavItem(title: 'About', onTap: onAboutTap),
            _NavItem(title: 'Services', onTap: onServicesTap),
            _NavItem(title: 'Skills', onTap: onSkillsTap),
            _NavItem(title: 'Projects', onTap: onProjectsTap),
            _NavItem(title: 'Contact', onTap: onContactTap),
            const SizedBox(width: 8),
            Tooltip(
              message: 'Toggle theme',
              child: Container(
                width: 42,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white24),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onThemeToggle,
                  iconSize: 16,
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: onContactTap,
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
                foregroundColor: Colors.white,
                side: BorderSide(color: primary.withValues(alpha: 0.8)),
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
                  Icon(Icons.arrow_forward_rounded, size: 14, color: primary),
                ],
              ),
            ),
          ] else
            Container(
              decoration: BoxDecoration(
                color: primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: primary.withValues(alpha: 0.25)),
              ),
              child: IconButton(
                tooltip: 'Open navigation menu',
                onPressed: () => _openMobileMenu(context),
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final Color primary;
  final double size;

  const _Logo({required this.primary, this.size = 36});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primary, primary.withValues(alpha: 0.78)],
        ),
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.25),
            blurRadius: 17,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        'U',
        style: TextStyle(
          color: Colors.black,
          fontSize: size * 0.52,
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
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final highlighted = widget.active || _hovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: highlighted ? primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: highlighted ? primary : Colors.white70,
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
      leading: Icon(icon, color: primary),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: Colors.white54,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hoverColor: primary.withValues(alpha: 0.08),
    );
  }
}
