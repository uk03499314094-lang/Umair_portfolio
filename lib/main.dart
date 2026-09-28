import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/services_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const UmairPortfolioApp());
}

class UmairPortfolioApp extends StatefulWidget {
  const UmairPortfolioApp({super.key});

  @override
  State<UmairPortfolioApp> createState() => _UmairPortfolioAppState();
}

class _UmairPortfolioAppState extends State<UmairPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Umair Khan | Full-Stack & Flutter Developer',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: PortfolioHomePage(
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const PortfolioHomePage({
    super.key,
    required this.onThemeToggle,
  });

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PortfolioNavbar(
            onAboutTap: () => _scrollToSection(aboutKey),
            onSkillsTap: () => _scrollToSection(skillsKey),
            onProjectsTap: () => _scrollToSection(projectsKey),
            onServicesTap: () => _scrollToSection(servicesKey),
            onContactTap: () => _scrollToSection(contactKey),
            onThemeToggle: widget.onThemeToggle,
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero Section
                  HeroSection(
                    onProjectsTap: () => _scrollToSection(projectsKey),
                    onContactTap: () => _scrollToSection(contactKey),
                  ),

                  // About Section
                  Container(
                    key: aboutKey,
                    child: const AboutSection(),
                  ),

                  // Skills Section
                  Container(
                    key: skillsKey,
                    child: const SkillsSection(),
                  ),

                  // Projects Section
                  Container(
                    key: projectsKey,
                    child: const ProjectsSection(),
                  ),

                  // Services Section
                  Container(
                    key: servicesKey,
                    child: const ServicesSection(),
                  ),

                  // Contact Section
                  Container(
                    key: contactKey,
                    child: const ContactSection(),
                  ),

                  // Footer
                  const PortfolioFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}