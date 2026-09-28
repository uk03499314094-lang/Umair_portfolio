import 'package:flutter/material.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 35,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UMAIR',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: primary,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'KHAN',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            'Full-Stack & Flutter Developer',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 22),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              IconButton(
                onPressed: () {},
                tooltip: 'GitHub',
                icon: const Icon(Icons.code),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'LinkedIn',
                icon: const Icon(Icons.business_center_outlined),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Email',
                icon: const Icon(Icons.email_outlined),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Divider(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),

          const SizedBox(height: 18),

          Text(
            '© 2026 Umair Khan. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}