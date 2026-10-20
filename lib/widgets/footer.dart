import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioFooter extends StatefulWidget {
  const PortfolioFooter({super.key, this.onBackToTop});

  final VoidCallback? onBackToTop;

  @override
  State<PortfolioFooter> createState() => _PortfolioFooterState();
}

class _PortfolioFooterState extends State<PortfolioFooter> {
  bool _githubHover = false;
  bool _linkedinHover = false;
  bool _emailHover = false;
  bool _topHover = false;

  static const Color _background = Color(0xFF05080C);
  static const Color _border = Color(0xFF202B36);
  static const Color _muted = Color(0xFF7F8A96);
  static const Color _brightMuted = Color(0xFFB0B8C1);

  Future<void> _openUrl(String value) async {
    try {
      final launched = await launchUrl(
        Uri.parse(value),
        mode: LaunchMode.externalApplication,
      );
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open this link.')),
        );
      }
    } catch (e) {
      debugPrint('Could not open URL: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open this link.')),
        );
      }
    }
  }

  Future<void> _openEmail() async {
    try {
      final launched = await launchUrl(
        Uri.parse('mailto:uk03499314094@gmail.com'),
      );
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open your email app.')),
        );
      }
    } catch (e) {
      debugPrint('Could not open email: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open your email app.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 760;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: _background,
        border: Border(top: BorderSide(color: _border, width: 1)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 22 : 60,
              vertical: isMobile ? 40 : 58,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrand(primary),
                        const SizedBox(height: 35),
                        _buildSocialSection(primary),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: _buildBrand(primary)),
                        const SizedBox(width: 45),
                        Expanded(flex: 2, child: _buildSocialSection(primary)),
                      ],
                    ),
            ),
          ),
          Container(height: 1, color: _border),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 22 : 60,
              vertical: 22,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                runSpacing: 15,
                children: [
                  _buildCopyright(year),
                  _buildBuiltWith(primary),
                  if (widget.onBackToTop != null) _buildBackToTop(primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrand(Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, primary.withValues(alpha: 0.70)],
                ),
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.20),
                    blurRadius: 20,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Text(
                'U',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(width: 14),
            const Flexible(
              child: Text(
                'UMAIR KHAN',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'FULL-STACK DEVELOPER • FLUTTER DEVELOPER\nAI & AUTOMATION',
          style: TextStyle(
            color: primary,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            height: 1.8,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Building modern digital experiences, intelligent applications and practical solutions with clean and scalable technology.',
          style: TextStyle(color: _muted, fontSize: 13, height: 1.8),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0xFF0B1118),
            border: Border.all(color: _border),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: Color(0xFF42D392), size: 9),
              SizedBox(width: 9),
              Text(
                'Open to opportunities',
                style: TextStyle(
                  color: _brightMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialSection(Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "LET'S CONNECT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 20),
        _buildSocialItem(
          icon: Icons.code_rounded,
          title: 'GitHub',
          value: 'uk03499314094-lang',
          primary: primary,
          hovered: _githubHover,
          onEnter: () => setState(() => _githubHover = true),
          onExit: () => setState(() => _githubHover = false),
          onTap: () => _openUrl('https://github.com/uk03499314094-lang'),
        ),
        const SizedBox(height: 10),
        _buildSocialItem(
          icon: Icons.business_center_outlined,
          title: 'LinkedIn',
          value: 'Umair Khan',
          primary: primary,
          hovered: _linkedinHover,
          onEnter: () => setState(() => _linkedinHover = true),
          onExit: () => setState(() => _linkedinHover = false),
          onTap: () => _openUrl(
            'https://www.linkedin.com/in/umair-khan-433605364',
          ),
        ),
        const SizedBox(height: 10),
        _buildSocialItem(
          icon: Icons.email_outlined,
          title: 'EMAIL',
          value: 'uk03499314094@gmail.com',
          primary: primary,
          hovered: _emailHover,
          onEnter: () => setState(() => _emailHover = true),
          onExit: () => setState(() => _emailHover = false),
          onTap: _openEmail,
        ),
      ],
    );
  }

  Widget _buildSocialItem({
    required IconData icon,
    required String title,
    required String value,
    required Color primary,
    required bool hovered,
    required VoidCallback onEnter,
    required VoidCallback onExit,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
          transform: Matrix4.translationValues(hovered ? 4 : 0, 0, 0),
          decoration: BoxDecoration(
            color: hovered
                ? primary.withValues(alpha: 0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: hovered ? primary : _border),
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: primary, size: 19),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: primary,
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _brightMuted,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_outward_rounded,
                color: primary.withValues(alpha: hovered ? 1 : 0.5),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCopyright(int year) {
    return Text(
      '© $year Umair Khan. All rights reserved.',
      style: const TextStyle(color: Color(0xFF66717D), fontSize: 11),
    );
  }

  Widget _buildBuiltWith(Color primary) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Crafted with',
          style: TextStyle(color: Color(0xFF66717D), fontSize: 11),
        ),
        const SizedBox(width: 7),
        Icon(Icons.favorite_rounded, color: primary, size: 14),
        const SizedBox(width: 6),
        const Text(
          'Flutter',
          style: TextStyle(
            color: _brightMuted,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildBackToTop(Color primary) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _topHover = true),
      onExit: (_) => setState(() => _topHover = false),
      child: GestureDetector(
        onTap: widget.onBackToTop,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            color: _topHover
                ? primary.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _topHover ? primary : _border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_upward_rounded, size: 14, color: primary),
              const SizedBox(width: 6),
              const Text(
                'BACK TO TOP',
                style: TextStyle(
                  color: _brightMuted,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
