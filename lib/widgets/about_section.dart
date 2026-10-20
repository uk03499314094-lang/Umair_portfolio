
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _statsController;

  @override
  void initState() {
    super.initState();

    _statsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();
  }

  @override
  void dispose() {
    _statsController.dispose();
    super.dispose();
  }

  Future<void> _openResume() async {
    final uri = Uri.base.resolve('assets/resume/cv.pdf');

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 85,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(context),

          const SizedBox(height: 38),

          isMobile
              ? Column(
                  children: [
                    _buildAboutCard(context),
                    const SizedBox(height: 20),
                    _buildInfoCard(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildAboutCard(context),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      flex: 4,
                      child: _buildInfoCard(context),
                    ),
                  ],
                ),

          const SizedBox(height: 28),

          _buildStats(context),
        ],
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 34,
              height: 2,
              color: primary,
            ),
            const SizedBox(width: 10),
            Text(
              'ABOUT ME',
              style: TextStyle(
                color: primary,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Building Digital Solutions\nThat Make a Difference',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                height: 1.05,
              ),
        ),
      ],
    );
  }

  Widget _buildAboutCard(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1118),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF202B36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I'm a passionate developer focused on web development, "
            "mobile applications, AI and automation.",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              height: 1.65,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            'I enjoy solving real-world problems with technology and '
            'creating practical digital products with clean, scalable '
            'architecture.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.65,
            ),
          ),

          const SizedBox(height: 25),

          OutlinedButton.icon(
            onPressed: _openResume,
            icon: const Icon(
              Icons.download_rounded,
              size: 17,
            ),
            label: const Text('DOWNLOAD RESUME'),
            style: OutlinedButton.styleFrom(
              foregroundColor: primary,
              side: BorderSide(
                color: primary.withValues(alpha: 0.7),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1118),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF202B36),
        ),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.person_outline_rounded,
            label: 'Name',
            value: 'Umair Khan',
            primary: primary,
          ),
          const SizedBox(height: 18),
          _InfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'uk03499314094@gmail.com',
            primary: primary,
          ),
          const SizedBox(height: 18),
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: 'Mardan, KPK, Pakistan',
            primary: primary,
          ),
          const SizedBox(height: 18),
          _InfoRow(
            icon: Icons.verified_outlined,
            label: 'Availability',
            value: 'Available for Freelance',
            primary: primary,
          ),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return AnimatedBuilder(
      animation: _statsController,
      builder: (context, child) {
        final progress = Curves.easeOutCubic.transform(
          _statsController.value,
        );

        return Row(
          children: [
            Expanded(
              child: _StatCard(
                value: '${(2 * progress).toStringAsFixed(0)}+',
                label: 'Years Learning',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: '${(20 * progress).toStringAsFixed(0)}+',
                label: 'Projects',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: '${(15 * progress).toStringAsFixed(0)}+',
                label: 'Technologies',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: '${(100 * progress).toStringAsFixed(0)}%',
                label: 'Passion',
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color primary;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(
            icon,
            size: 17,
            color: primary,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1118),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF202B36),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: primary,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.white54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}