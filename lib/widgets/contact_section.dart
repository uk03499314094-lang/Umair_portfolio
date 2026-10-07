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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _sending = true;
    });

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final subject = Uri.encodeComponent(
      'Portfolio Contact from $name',
    );

    final body = Uri.encodeComponent(
      'Name: $name\n'
      'Email: $email\n\n'
      'Message:\n$message',
    );

    final uri = Uri.parse(
      'mailto:uk03499314094@gmail.com?subject=$subject&body=$body',
    );

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);

        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your email app has been opened.'),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Could not open your email application.',
              ),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _sending = false;
        });
      }
    }
  }

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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(context),

          const SizedBox(height: 45),

          if (isMobile)
            Column(
              children: [
                _buildIntroCard(context),
                const SizedBox(height: 20),
                _buildFormCard(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildIntroCard(context),
                ),
                const SizedBox(width: 25),
                Expanded(
                  flex: 6,
                  child: _buildFormCard(context),
                ),
              ],
            ),
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
              width: 35,
              height: 2,
              color: primary,
            ),
            const SizedBox(width: 10),
            Text(
              'GET IN TOUCH',
              style: TextStyle(
                color: primary,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          "Let's Work Together",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -1,
              ),
        ),

        const SizedBox(height: 8),

        Text(
          'Have a project, idea or opportunity? Let’s create something great together.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildIntroCard(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1118),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF202B36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: primary.withValues(alpha: 0.18),
              ),
            ),
            child: Icon(
              Icons.mail_outline_rounded,
              color: primary,
              size: 28,
            ),
          ),

          const SizedBox(height: 28),

          const Text(
            'Have an idea?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'I’m always interested in discussing new projects, creative ideas and opportunities.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.7,
                ),
          ),

          const SizedBox(height: 30),

          _ContactItem(
            icon: Icons.email_outlined,
            title: 'EMAIL',
            value: 'uk03499314094@gmail.com',
            primary: primary,
            onTap: _openEmail,
          ),

          const SizedBox(height: 15),

          _ContactItem(
            icon: Icons.location_on_outlined,
            title: 'LOCATION',
            value: 'Mardan, KPK, Pakistan',
            primary: primary,
          ),

          const SizedBox(height: 15),

          _ContactItem(
            icon: Icons.work_outline_rounded,
            title: 'AVAILABILITY',
            value: 'Available for Freelance',
            primary: primary,
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              _SocialButton(
                icon: Icons.code_rounded,
                primary: primary,
                onTap: () => _openUrl(
                  'https://github.com/uk03499314094-lang',
                ),
              ),

              const SizedBox(width: 10),

              _SocialButton(
                icon: Icons.business_center_outlined,
                primary: primary,
                onTap: () => _openUrl(
                  'https://www.linkedin.com/in/umair-khan-433605364',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1118),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF202B36),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send Me a Message',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Fill out the form and I’ll get back to you.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 25),

            _buildLabel('YOUR NAME'),

            const SizedBox(height: 8),

            _buildTextField(
              controller: _nameController,
              hint: 'Enter your name',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }

                return null;
              },
            ),

            const SizedBox(height: 18),

            _buildLabel('EMAIL ADDRESS'),

            const SizedBox(height: 8),

            _buildTextField(
              controller: _emailController,
              hint: 'Enter your email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }

                if (!value.contains('@') ||
                    !value.contains('.')) {
                  return 'Enter a valid email';
                }

                return null;
              },
            ),

            const SizedBox(height: 18),

            _buildLabel('MESSAGE'),

            const SizedBox(height: 8),

            _buildTextField(
              controller: _messageController,
              hint: 'Tell me about your project...',
              icon: Icons.chat_bubble_outline,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your message';
                }

                if (value.trim().length < 10) {
                  return 'Message should be at least 10 characters';
                }

                return null;
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _sending ? null : _sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.black,
                  disabledBackgroundColor:
                      primary.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _sending
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            'SEND MESSAGE',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 17,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    final primary = Theme.of(context).colorScheme.primary;

    return Text(
      text,
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
    final primary = Theme.of(context).colorScheme.primary;

    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF66717D),
          fontSize: 13,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            bottom: maxLines > 1 ? 70 : 0,
          ),
          child: Icon(
            icon,
            color: primary.withValues(alpha: 0.65),
            size: 19,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFF070B10),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF202B36),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF202B36),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primary,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color primary;
  final VoidCallback? onTap;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.primary,
    this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.primary.withValues(alpha: 0.06)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? widget.primary.withValues(alpha: 0.18)
                  : const Color(0xFF202B36),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: widget.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.primary,
                  size: 19,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.primary,
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.onTap != null)
                Icon(
                  Icons.arrow_outward_rounded,
                  color: widget.primary.withValues(
                    alpha: _hovered ? 1 : 0.45,
                  ),
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
  final IconData icon;
  final Color primary;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.primary,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: _hovered
                ? widget.primary.withValues(alpha: 0.15)
                : widget.primary.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.primary.withValues(
                alpha: _hovered ? 0.4 : 0.15,
              ),
            ),
          ),
          child: Icon(
            widget.icon,
            color: widget.primary,
            size: 20,
          ),
        ),
      ),
    );
  }
}