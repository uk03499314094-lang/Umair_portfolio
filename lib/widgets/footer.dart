import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioFooter extends StatefulWidget {
  const PortfolioFooter({super.key});

  @override
  State<PortfolioFooter> createState() => _PortfolioFooterState();
}

class _PortfolioFooterState extends State<PortfolioFooter> {
  bool _githubHover = false;
  bool _linkedinHover = false;
  bool _emailHover = false;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    }
  }

  Future<void> _openEmail() async {
    final uri = Uri.parse(
      'mailto:uk03499314094@gmail.com',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF05080C),
        border: Border(
          top: BorderSide(
            color: Color(0xFF202B36),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: 60,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      _buildBrand(primary),
                      const SizedBox(height: 35),
                      _buildSocialSection(primary),
                    ],
                  )
                : Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buildBrand(primary),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildSocialSection(primary),
                      ),
                    ],
                  ),
          ),

          Container(
            height: 1,
            color: const Color(0xFF202B36),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: 22,
            ),
            child: isMobile
                ? Column(
                    children: [
                      _buildCopyright(),
                      const SizedBox(height: 10),
                      _buildBuiltWith(primary),
                    ],
                  )
                : Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCopyright(),
                      _buildBuiltWith(primary),
                    ],
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
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Center(
                child: Text(
                  'U',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 13),

            const Text(
              'UMAIR KHAN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Text(
          'Full-Stack Developer • Flutter Developer\n'
          'AI & Automation',
          style: TextStyle(
            color: primary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 14),

        const SizedBox(
          width: 480,
          child: Text(
            'Building modern digital experiences, intelligent applications '
            'and practical solutions with clean and scalable technology.',
            style: TextStyle(
              color: Color(0xFF7F8A96),
              fontSize: 13,
              height: 1.7,
            ),
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
          'CONNECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.8,
          ),
        ),

        const SizedBox(height: 18),

        _buildSocialItem(
          icon: Icons.code_rounded,
          title: 'GitHub',
          value: 'uk03499314094-lang',
          primary: primary,
          hovered: _githubHover,
          onEnter: () {
            setState(() {
              _githubHover = true;
            });
          },
          onExit: () {
            setState(() {
              _githubHover = false;
            });
          },
          onTap: () => _openUrl(
            'https://github.com/uk03499314094-lang',
          ),
        ),

        const SizedBox(height: 10),

        _buildSocialItem(
          icon: Icons.business_center_outlined,
          title: 'LinkedIn',
          value: 'Umair Khan',
          primary: primary,
          hovered: _linkedinHover,
          onEnter: () {
            setState(() {
              _linkedinHover = true;
            });
          },
          onExit: () {
            setState(() {
              _linkedinHover = false;
            });
          },
          onTap: () => _openUrl(
            'https://www.linkedin.com/in/umair-khan-433605364',
          ),
        ),

        const SizedBox(height: 10),

        _buildSocialItem(
          icon: Icons.email_outlined,
          title: 'Email',
          value: 'uk03499314094@gmail.com',
          primary: primary,
          hovered: _emailHover,
          onEnter: () {
            setState(() {
              _emailHover = true;
            });
          },
          onExit: () {
            setState(() {
              _emailHover = false;
            });
          },
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
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: hovered
                ? primary.withValues(alpha: 0.07)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hovered
                  ? primary.withValues(alpha: 0.20)
                  : const Color(0xFF202B36),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: primary,
                size: 18,
              ),

              const SizedBox(width: 11),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: primary,
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    value,
                    style: const TextStyle(
                      color: Color(0xFFB0B8C1),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 18),

              AnimatedContainer(
                duration:
                    const Duration(milliseconds: 200),
                transform: Matrix4.identity()
                  ..translate(
                    hovered ? 4.0 : 0.0,
                    0.0,
                  ),
                child: Icon(
                  Icons.arrow_outward_rounded,
                  color: primary.withValues(
                    alpha: hovered ? 1 : 0.45,
                  ),
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCopyright() {
    return const Text(
      '© 2026 Umair Khan. All rights reserved.',
      style: TextStyle(
        color: Color(0xFF66717D),
        fontSize: 11,
      ),
    );
  }

  Widget _buildBuiltWith(Color primary) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Built with ',
          style: TextStyle(
            color: Color(0xFF66717D),
            fontSize: 11,
          ),
        ),

        Icon(
          Icons.favorite_rounded,
          color: primary,
          size: 13,
        ),

        const SizedBox(width: 5),

        const Text(
          'Flutter',
          style: TextStyle(
            color: Color(0xFFB0B8C1),
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}