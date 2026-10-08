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
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? 850 : 650,
      ),
      child: Stack(
        children: [
          // Animated background
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _HeroBackgroundPainter(
                    progress: _controller.value,
                    primary: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 24 : 60,
              isMobile ? 55 : 65,
              isMobile ? 24 : 60,
              70,
            ),
            child: isMobile
                ? _buildMobile(context)
                : _buildDesktop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 55,
          child: _buildContent(context),
        ),

        const SizedBox(width: 35),

        Expanded(
          flex: 45,
          child: _buildVisual(context),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        _buildVisual(context),
        const SizedBox(height: 45),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    final mainTextColor = isDark
        ? Colors.white
        : const Color(0xFF10151B);

    final secondaryTextColor = isDark
        ? const Color(0xFFD0D6DD)
        : const Color(0xFF4F5B68);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Small intro
        Row(
          children: [
            Container(
              width: 34,
              height: 2,
              color: primary,
            ),

            const SizedBox(width: 10),

            Text(
              "HELLO, I'M",
              style: TextStyle(
                color: primary,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Main name
        RichText(
          text: TextSpan(
            style: theme.textTheme.displayLarge?.copyWith(
              fontSize: MediaQuery.of(context).size.width < 1100
                  ? 52
                  : 66,
              height: 0.98,
              letterSpacing: -2.5,
              fontWeight: FontWeight.w900,
              color: mainTextColor,
            ),
            children: [
              TextSpan(
                text: 'Umair ',
                style: TextStyle(
                  color: mainTextColor,
                ),
              ),

              TextSpan(
                text: 'Khan',
                style: TextStyle(
                  color: primary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        // Role
        Text(
          'Full-Stack Developer | Flutter Developer | AI & Automation',
          style: theme.textTheme.titleLarge?.copyWith(
            color: isDark
                ? Colors.white
                : const Color(0xFF202832),
            fontWeight: FontWeight.w700,
            height: 1.35,
          ),
        ),

        const SizedBox(height: 18),

        // Description
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 620,
          ),
          child: Text(
            'I build modern web, mobile and AI-powered digital '
            'experiences with clean code, scalable solutions '
            'and creative ideas.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: secondaryTextColor,
              height: 1.65,
            ),
          ),
        ),

        const SizedBox(height: 30),

        // Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: widget.onContactTap,
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 17,
              ),
              label: const Text('HIRE ME'),
            ),

            OutlinedButton.icon(
              onPressed: widget.onProjectsTap,
              icon: const Icon(
                Icons.work_outline_rounded,
                size: 17,
              ),
              label: const Text('VIEW MY WORK'),
            ),
          ],
        ),

        const SizedBox(height: 25),

        // Availability
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withValues(
                      alpha: 0.5,
                    ),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 9),

            Text(
              'AVAILABLE FOR FREELANCE',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: isDark
                    ? Colors.white70
                    : const Color(0xFF3D4854),
              ),
            ),
          ],
        ),

        const SizedBox(height: 23),

        // Socials
        Row(
          children: [
            _SocialIcon(
              icon: Icons.code_rounded,
              onTap: () {
                _openUrl(
                  'https://github.com/uk03499314094-lang',
                );
              },
            ),

            const SizedBox(width: 10),

            _SocialIcon(
              icon: Icons.business_center_outlined,
              onTap: () {
                _openUrl(
                  'https://www.linkedin.com/in/umair-khan-433605364',
                );
              },
            ),

            const SizedBox(width: 10),

            _SocialIcon(
              icon: Icons.email_outlined,
              onTap: () {
                _openUrl(
                  'mailto:uk03499314094@gmail.com',
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVisual(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    final imageSize = isMobile ? 310.0 : 430.0;

    return SizedBox(
      height: isMobile ? 430 : 560,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Rotating ring
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * math.pi * 2,
                child: Container(
                  width: imageSize + 55,
                  height: imageSize + 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primary.withValues(alpha: 0.18),
                      width: 1.5,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: imageSize / 2 + 20,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: primary.withValues(
                                  alpha: 0.7,
                                ),
                                blurRadius: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Outer glow
          Container(
            width: imageSize + 25,
            height: imageSize + 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: primary.withValues(
                    alpha: isDark ? 0.16 : 0.10,
                  ),
                  blurRadius: 70,
                  spreadRadius: 15,
                ),
              ],
            ),
          ),

          // Profile image
          Container(
            width: imageSize,
            height: imageSize,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  primary,
                  primary.withValues(alpha: 0.15),
                  primary,
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? const Color(0xFF070B10)
                    : const Color(0xFFF5F7FA),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,

                  // Professional fallback if image is missing.
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {
                    return Container(
                      color: isDark
                          ? const Color(0xFF0B1118)
                          : const Color(0xFFE9EDF2),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              size: 75,
                              color: primary.withValues(
                                alpha: 0.7,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'UMAIR KHAN',
                              style: TextStyle(
                                color: primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
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
          ),

          // Flutter badge
          Positioned(
            top: isMobile ? 25 : 55,
            left: isMobile ? 0 : -15,
            child: _TechBadge(
              icon: Icons.flutter_dash,
              title: 'Flutter',
              primary: primary,
            ),
          ),

          // React badge
          Positioned(
            top: isMobile ? 65 : 80,
            right: isMobile ? 0 : -5,
            child: _TechBadge(
              icon: Icons.web_outlined,
              title: 'React.js',
              primary: primary,
            ),
          ),

          // Python badge
          Positioned(
            bottom: isMobile ? 60 : 90,
            left: isMobile ? 5 : -10,
            child: _TechBadge(
              icon: Icons.code_rounded,
              title: 'Python',
              primary: primary,
            ),
          ),

          // MongoDB badge
          Positioned(
            bottom: isMobile ? 30 : 55,
            right: isMobile ? 0 : -10,
            child: _TechBadge(
              icon: Icons.storage_outlined,
              title: 'MongoDB',
              primary: primary,
            ),
          ),

          // Decorative dots
          Positioned(
            top: 30,
            right: isMobile ? 25 : 45,
            child: _Dot(color: primary),
          ),

          Positioned(
            bottom: 25,
            left: isMobile ? 30 : 55,
            child: _Dot(color: primary),
          ),
        ],
      ),
    );
  }
}

class _TechBadge extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color primary;

  const _TechBadge({
    required this.icon,
    required this.title,
    required this.primary,
  });

  @override
  State<_TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<_TechBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offset =
            math.sin(_controller.value * math.pi) * 5;

        return Transform.translate(
          offset: Offset(0, -offset),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF111821)
                  .withValues(alpha: 0.94),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.primary.withValues(alpha: 0.20),
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.primary.withValues(alpha: 0.08),
                  blurRadius: 18,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 17,
                  color: widget.primary,
                ),

                const SizedBox(width: 7),

                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: hovered
                ? primary.withValues(alpha: 0.12)
                : isDark
                    ? const Color(0xFF111821)
                    : Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: hovered
                  ? primary.withValues(alpha: 0.45)
                  : isDark
                      ? const Color(0xFF26313D)
                      : const Color(0xFFD0D5DB),
            ),
          ),
          child: Icon(
            widget.icon,
            size: 18,
            color: hovered
                ? primary
                : isDark
                    ? Colors.white70
                    : const Color(0xFF4F5B68),
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.7),
            blurRadius: 12,
          ),
        ],
      ),
    );
  }
}

class _HeroBackgroundPainter extends CustomPainter {
  final double progress;
  final Color primary;

  _HeroBackgroundPainter({
    required this.progress,
    required this.primary,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6;

    final center = Offset(
      size.width * 0.75,
      size.height * 0.50,
    );

    for (int i = 0; i < 5; i++) {
      final radius = 130.0 + (i * 65);

      paint.color = primary.withValues(
        alpha: 0.035,
      );

      canvas.drawCircle(
        center,
        radius,
        paint,
      );
    }

    // Small moving particles
    final particlePaint = Paint()
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 18; i++) {
      final angle =
          (i / 18) * math.pi * 2 +
          progress * math.pi * 2;

      final radius =
          180.0 + (i % 3) * 55;

      final x =
          center.dx + math.cos(angle) * radius;

      final y =
          center.dy + math.sin(angle) * radius;

      particlePaint.color = primary.withValues(
        alpha: 0.12,
      );

      canvas.drawCircle(
        Offset(x, y),
        i % 3 == 0 ? 2 : 1,
        particlePaint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant _HeroBackgroundPainter oldDelegate,
  ) {
    return oldDelegate.progress != progress;
  }
}