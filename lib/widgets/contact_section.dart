import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _sending = false;

  static const _email = 'uk03499314094@gmail.com';
  static const _github = 'https://github.com/uk03499314094-lang';
  static const _linkedin =
      'https://www.linkedin.com/in/umair-khan-433605364';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final subject = Uri.encodeComponent('Portfolio Contact from $name');
    final body = Uri.encodeComponent(
      'Name: $name\nEmail: $email\n\nMessage:\n$message',
    );
    final uri = Uri.parse('mailto:$_email?subject=$subject&body=$body');

    try {
      final launched = await launchUrl(uri);
      if (!mounted) return;

      if (launched) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Your email app has opened. Send the email from there.',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not open your email app. Please email me directly.',
            ),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not open your email app. Please email me directly.',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _openUrl(String url) async {
    try {
      final launched = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open this link.')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open this link.')),
        );
      }
    }
  }

  Future<void> _openEmail() async {
    try {
      final launched = await launchUrl(Uri.parse('mailto:$_email'));
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open your email application.'),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open your email application.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 850;
    final horizontalPadding =
        width < 600 ? 20.0 : (width < 1000 ? 36.0 : 60.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: width < 600 ? 70 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(context),
          const SizedBox(height: 38),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: [
                    _buildIntroCard(context),
                    const SizedBox(height: 18),
                    _buildFormCard(context),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: _buildIntroCard(context)),
                  const SizedBox(width: 22),
                  Expanded(flex: 6, child: _buildFormCard(context)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionEyebrow(label: 'GET IN TOUCH', primary: primary),
        const SizedBox(height: 13),
        Text(
          "Let's Work Together",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 9),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            'Have a project, idea or opportunity? Let’s create something great together.',
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIntroCard(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.11),
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: primary.withValues(alpha: 0.30)),
              boxShadow: [
                BoxShadow(
                  color: primary.withValues(alpha: 0.09),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Icon(
              Icons.mark_email_unread_outlined,
              color: primary,
              size: 29,
            ),
          ),
          const SizedBox(height: 26),
          Text(
            'Have an idea?',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: isDark ? Colors.white : theme.colorScheme.onSurface,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            'I’m interested in discussing new projects, creative ideas and opportunities.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? const Color(0xFF9AA6B2)
                  : theme.colorScheme.onSurfaceVariant,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 25),
          _ContactItem(
            icon: Icons.email_outlined,
            title: 'EMAIL',
            value: _email,
            onTap: _openEmail,
          ),
          const SizedBox(height: 12),
          const _ContactItem(
            icon: Icons.location_on_outlined,
            title: 'LOCATION',
            value: 'Mardan, KPK, Pakistan',
          ),
          const SizedBox(height: 12),
          const _ContactItem(
            icon: Icons.work_outline_rounded,
            title: 'AVAILABILITY',
            value: 'Available for Freelance',
          ),
          const SizedBox(height: 23),
          Text(
            'CONNECT WITH ME',
            style: TextStyle(
              color: primary,
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _SocialButton(
                tooltip: 'GitHub',
                icon: Icons.code_rounded,
                onTap: () => _openUrl(_github),
              ),
              const SizedBox(width: 10),
              _SocialButton(
                tooltip: 'LinkedIn',
                icon: Icons.business_center_outlined,
                onTap: () => _openUrl(_linkedin),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return _GlassCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Me a Message',
              style: theme.textTheme.titleLarge?.copyWith(
                color: isDark ? Colors.white : theme.colorScheme.onSurface,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Fill out the form and I’ll prepare an email for you to send.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            _buildLabel('YOUR NAME', primary),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _nameController,
              hint: 'Enter your name',
              icon: Icons.person_outline_rounded,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 17),
            _buildLabel('EMAIL ADDRESS', primary),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _emailController,
              hint: 'Enter your email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                final email = value?.trim() ?? '';
                if (email.isEmpty) return 'Please enter your email';
                if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                    .hasMatch(email)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 17),
            _buildLabel('MESSAGE', primary),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _messageController,
              hint: 'Tell me about your project...',
              icon: Icons.chat_bubble_outline_rounded,
              maxLines: 5,
              validator: (value) {
                final message = value?.trim() ?? '';
                if (message.isEmpty) return 'Please enter your message';
                if (message.length < 10) {
                  return 'Message should be at least 10 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 23),
            SizedBox(
              width: double.infinity,
              height: 53,
              child: ElevatedButton(
                onPressed: _sending ? null : _sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.black,
                  disabledBackgroundColor: primary.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: _sending ? 0 : 5,
                  shadowColor: primary.withValues(alpha: 0.25),
                ),
                child: _sending
                    ? const SizedBox(
                        width: 19,
                        height: 19,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SEND MESSAGE',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_rounded, size: 17),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Note: this opens your email app; it does not send the message automatically.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label, Color primary) {
    return Text(
      label,
      style: TextStyle(
        color: primary,
        fontSize: 9,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.3,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(
        color: isDark ? Colors.white : theme.colorScheme.onSurface,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: isDark ? const Color(0xFF66717D) : theme.hintColor,
          fontSize: 13,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(bottom: maxLines > 1 ? 70 : 0),
          child: Icon(
            icon,
            color: primary.withValues(alpha: 0.72),
            size: 19,
          ),
        ),
        filled: true,
        fillColor:
            isDark ? const Color(0xFF070B10) : theme.colorScheme.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: isDark
                ? const Color(0xFF26313D)
                : theme.dividerColor.withValues(alpha: 0.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: primary, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}

class _SectionEyebrow extends StatelessWidget {
  final String label;
  final Color primary;

  const _SectionEyebrow({required this.label, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 35,
          height: 2,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            color: primary,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}

class _GlassCard extends StatefulWidget {
  final Widget child;

  const _GlassCard({required this.child});

  @override
  State<_GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<_GlassCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        width: double.infinity,
        transform: Matrix4.identity()..translate(0.0, _hovered ? -4.0 : 0.0),
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0B1118) : theme.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? primary.withValues(alpha: 0.52)
                : (isDark
                    ? const Color(0xFF26313D)
                    : theme.dividerColor.withValues(alpha: 0.8)),
          ),
          boxShadow: [
            BoxShadow(
              color: primary.withValues(alpha: _hovered ? 0.11 : 0.03),
              blurRadius: _hovered ? 32 : 18,
              offset: Offset(0, _hovered ? 13 : 7),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _hovered
                ? primary.withValues(alpha: 0.06)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? primary.withValues(alpha: 0.22)
                  : (isDark
                      ? const Color(0xFF26313D)
                      : theme.dividerColor.withValues(alpha: 0.8)),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.09),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(widget.icon, color: primary, size: 19),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: primary,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.value,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color:
                            isDark ? Colors.white : theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.onTap != null)
                Icon(
                  Icons.arrow_outward_rounded,
                  color: primary.withValues(alpha: _hovered ? 1 : 0.5),
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: _hovered ? 0.15 : 0.06),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: primary.withValues(alpha: _hovered ? 0.42 : 0.17),
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: primary.withValues(alpha: 0.12),
                        blurRadius: 18,
                      ),
                    ]
                  : const [],
            ),
            child: Icon(widget.icon, color: primary, size: 20),
          ),
        ),
      ),
    );
  }
}
