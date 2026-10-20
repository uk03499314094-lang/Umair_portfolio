import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  Offset _mouse = Offset.zero;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  Future<void> _open(String value) async {
    final uri = Uri.parse(value);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open this link. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final mobile = width < 760;
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF080D13) : const Color(0xFFF8FAFC),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => CustomPaint(
                painter: _Backdrop(
                  progress: _animation.value,
                  accent: theme.colorScheme.primary,
                  dark: dark,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              mobile ? 20 : (width < 1100 ? 36 : 64),
              mobile ? 28 : 54,
              mobile ? 20 : (width < 1100 ? 36 : 64),
              mobile ? 42 : 62,
            ),
            child: mobile
                ? Column(
                    children: [
                      _visual(context, mobile: true),
                      const SizedBox(height: 18),
                      _content(context, mobile: true),
                    ],
                  )
                : ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1440),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 11, child: _content(context, mobile: false)),
                        const SizedBox(width: 20),
                        Expanded(flex: 10, child: _visual(context, mobile: false)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context, {required bool mobile}) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;
    final dark = theme.brightness == Brightness.dark;
    final foreground = dark ? Colors.white : const Color(0xFF101820);
    final muted = dark ? const Color(0xFFB7C2CF) : const Color(0xFF536170);
    final width = MediaQuery.sizeOf(context).width;
    final nameSize = mobile ? (width < 360 ? 42.0 : 48.0) : (width < 1100 ? 54.0 : 70.0);

    return Column(
      crossAxisAlignment: mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: dark ? .12 : .09),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accent.withValues(alpha: .28)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: const Color(0xFF37D99A),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF37D99A).withValues(alpha: .55),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 9),
              Flexible(
                child: Text(
                  'AVAILABLE FOR CREATIVE WORK',
                  textAlign: mobile ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    color: accent,
                    fontSize: 10,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'HELLO, I’M',
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: muted,
            fontSize: 12,
            letterSpacing: 3,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: theme.textTheme.displayLarge?.copyWith(
              color: foreground,
              fontSize: nameSize,
              height: .98,
              letterSpacing: -2.4,
              fontWeight: FontWeight.w900,
            ),
            children: [
              const TextSpan(text: 'Umair\n'),
              TextSpan(
                text: 'Khan',
                style: TextStyle(
                  color: accent,
                  shadows: [
                    Shadow(color: accent.withValues(alpha: .35), blurRadius: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Full-Stack Developer\nFlutter • AI • Automation',
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: foreground,
            fontSize: mobile ? 17 : 21,
            height: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            'I create modern web and mobile experiences, intelligent AI solutions, and automation workflows that turn ideas into useful digital products.',
            textAlign: mobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(color: muted, height: 1.8, fontSize: 14),
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            _ActionButton(
              label: 'LET’S BUILD',
              icon: Icons.arrow_outward_rounded,
              filled: true,
              onPressed: widget.onContactTap,
            ),
            _ActionButton(
              label: 'EXPLORE PROJECTS',
              icon: Icons.grid_view_rounded,
              filled: false,
              onPressed: widget.onProjectsTap,
            ),
          ],
        ),
        const SizedBox(height: 26),
        Text(
          'OPEN TO FREELANCE OPPORTUNITIES',
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: muted,
            fontSize: 10,
            letterSpacing: 1,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: mobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _Social(
              icon: Icons.code_rounded,
              tooltip: 'GitHub',
              onTap: () => _open('https://github.com/uk03499314094-lang'),
            ),
            const SizedBox(width: 10),
            _Social(
              icon: Icons.business_center_outlined,
              tooltip: 'LinkedIn',
              onTap: () => _open('https://www.linkedin.com/in/umair-khan-433605364'),
            ),
            const SizedBox(width: 10),
            _Social(
              icon: Icons.email_outlined,
              tooltip: 'Email',
              onTap: () => _open('mailto:uk03499314094@gmail.com'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _visual(BuildContext context, {required bool mobile}) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;
    final dark = theme.brightness == Brightness.dark;
    final size = mobile ? (MediaQuery.sizeOf(context).width < 360 ? 205.0 : 228.0) : 330.0;

    return SizedBox(
      height: mobile ? 285 : 450,
      child: Center(
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() {
            _hovering = false;
            _mouse = Offset.zero;
          }),
          onHover: (event) {
            final box = context.findRenderObject();
            if (box is RenderBox && box.size.width > 0 && box.size.height > 0) {
              final point = box.globalToLocal(event.position);
              setState(() {
                _mouse = Offset(
                  ((point.dx / box.size.width) - .5).clamp(-.5, .5),
                  ((point.dy / box.size.height) - .5).clamp(-.5, .5),
                );
              });
            }
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final bob = math.sin(_animation.value * math.pi * 2) * 5;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, .001)
                  ..rotateX(_hovering && !mobile ? -_mouse.dy * .18 : 0)
                  ..rotateY(_hovering && !mobile ? _mouse.dx * .2 : 0),
                child: SizedBox(
                  width: size + 62,
                  height: mobile ? 280 : 420,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Transform.rotate(
                        angle: _animation.value * math.pi * 2,
                        child: Container(
                          width: size + 35,
                          height: size + 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: accent.withValues(alpha: .24)),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: accent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: accent.withValues(alpha: .8), blurRadius: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size + 15,
                        height: size + 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: accent.withValues(alpha: dark ? .22 : .13),
                              blurRadius: 55,
                              spreadRadius: 7,
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, bob),
                        child: Container(
                          width: size,
                          height: size,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              transform: GradientRotation(_animation.value * math.pi * 2),
                              colors: [
                                accent,
                                accent.withValues(alpha: .08),
                                const Color(0xFF4BCBFF),
                                accent,
                              ],
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: dark ? const Color(0xFF080D13) : const Color(0xFFF5F7FA),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile.jpg',
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                errorBuilder: (context, error, stack) => ColoredBox(
                                  color: dark ? const Color(0xFF101821) : const Color(0xFFE8EDF2),
                                  child: Center(child: Icon(Icons.person_rounded, size: 90, color: accent)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: mobile ? 24 : 55,
                        left: 0,
                        child: _Badge(icon: Icons.flutter_dash_rounded, title: 'Flutter', accent: accent),
                      ),
                      Positioned(
                        top: mobile ? 42 : 78,
                        right: 0,
                        child: _Badge(icon: Icons.web_rounded, title: 'React.js', accent: accent),
                      ),
                      Positioned(
                        bottom: mobile ? 43 : 65,
                        left: 0,
                        child: _Badge(icon: Icons.psychology_alt_rounded, title: 'AI / ML', accent: accent),
                      ),
                      Positioned(
                        bottom: mobile ? 25 : 42,
                        right: 0,
                        child: _Badge(icon: Icons.terminal_rounded, title: 'Python', accent: accent),
                      ),
                      Positioned(
                        top: 0,
                        right: mobile ? 20 : 40,
                        child: _FloatingLabel(
                          icon: Icons.auto_awesome_rounded,
                          text: 'BUILD • CREATE',
                          accent: accent,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: mobile ? 12 : 30,
                        child: _FloatingLabel(
                          icon: Icons.code_rounded,
                          text: '</> DEVELOPER',
                          accent: accent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return filled
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 17),
            label: Text(label),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              elevation: 8,
              shadowColor: accent.withValues(alpha: .3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 17),
            label: Text(label),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
              side: BorderSide(color: accent.withValues(alpha: .55)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color accent;

  const _Badge({required this.icon, required this.title, required this.accent});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: (dark ? const Color(0xFF111923) : Colors.white).withValues(alpha: .97),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: accent.withValues(alpha: .35)),
        boxShadow: [
          BoxShadow(color: accent.withValues(alpha: .12), blurRadius: 20, offset: const Offset(0, 6)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: accent),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: dark ? Colors.white : const Color(0xFF15202B),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingLabel extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color accent;

  const _FloatingLabel({required this.icon, required this.text, required this.accent});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
      decoration: BoxDecoration(
        color: (dark ? const Color(0xFF101720) : Colors.white).withValues(alpha: .95),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accent.withValues(alpha: .24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: accent, size: 13),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: dark ? Colors.white70 : const Color(0xFF4B5968),
              fontSize: 8,
              letterSpacing: .5,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _Social extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _Social({required this.icon, required this.tooltip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;
    final dark = theme.brightness == Brightness.dark;
    return Tooltip(
      message: tooltip,
      child: SizedBox(
        width: 46,
        height: 46,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: dark ? const Color(0xFF111821) : Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: dark ? const Color(0xFF26313D) : const Color(0xFFD0D5DB)),
          ),
          child: IconButton(
            tooltip: tooltip,
            onPressed: onTap,
            icon: Icon(icon, size: 19, color: accent),
          ),
        ),
      ),
    );
  }
}

class _Backdrop extends CustomPainter {
  final double progress;
  final Color accent;
  final bool dark;

  _Backdrop({required this.progress, required this.accent, required this.dark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * .74, size.height * .48);
    final rings = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .7
      ..color = accent.withValues(alpha: dark ? .07 : .045);
    for (var i = 0; i < 6; i++) {
      canvas.drawCircle(center, 110 + i * 64, rings);
    }

    final grid = Paint()
      ..color = accent.withValues(alpha: dark ? .025 : .016)
      ..strokeWidth = .5;
    const gap = 36.0;
    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    final dots = Paint()..style = PaintingStyle.fill;
    for (var i = 0; i < 22; i++) {
      final angle = i / 22 * math.pi * 2 + progress * math.pi * 2;
      final radius = 140 + (i % 5) * 43.0;
      dots.color = accent.withValues(alpha: dark ? .24 : .13);
      canvas.drawCircle(
        Offset(center.dx + math.cos(angle) * radius, center.dy + math.sin(angle) * radius),
        i % 4 == 0 ? 1.6 : 1,
        dots,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _Backdrop old) =>
      old.progress != progress || old.accent != accent || old.dark != dark;
}