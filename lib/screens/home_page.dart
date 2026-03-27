import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Keys for scrolling to specific sections
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return AppBar(
                backgroundColor: Colors.transparent,
                title: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _scrollToSection(_heroKey),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '< ',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          'Wsem',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          ' />',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions:
                    sizingInformation.isDesktop || sizingInformation.isTablet
                        ? [
                            _NavBarItem(
                                title: 'Home',
                                onTap: () => _scrollToSection(_heroKey)),
                            _NavBarItem(
                                title: 'About',
                                onTap: () => _scrollToSection(_aboutKey)),
                            _NavBarItem(
                                title: 'Projects',
                                onTap: () => _scrollToSection(_projectsKey)),
                            _NavBarItem(
                                title: 'Contact',
                                onTap: () => _scrollToSection(contactKey)),
                            const SizedBox(width: 20),
                          ]
                        : [
                            Builder(
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () =>
                                    Scaffold.of(context).openEndDrawer(),
                              ),
                            ),
                          ],
              );
            },
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 50),
            _DrawerItem(
                title: 'Home',
                onTap: () {
                  _scrollToSection(_heroKey);
                  Navigator.pop(context);
                }),
            _DrawerItem(
                title: 'About',
                onTap: () {
                  _scrollToSection(_aboutKey);
                  Navigator.pop(context);
                }),
            _DrawerItem(
                title: 'Projects',
                onTap: () {
                  _scrollToSection(_projectsKey);
                  Navigator.pop(context);
                }),
            _DrawerItem(
                title: 'Contact',
                onTap: () {
                  _scrollToSection(contactKey);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              key: _heroKey,
              onContactTap: () => _scrollToSection(contactKey),
            ),
            AboutSection(key: _aboutKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: contactKey),
            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: const Color(0xFF05080E),
              child: const Center(
                child: Text(
                  '© 2026 Wsem Dawoodi. Built with Flutter Web.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _isHovered ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: onTap,
    );
  }
}
