import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
              ).animate().fadeIn().slideY(begin: 0.3, end: 0),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ).animate().scaleX(delay: 200.ms, curve: Curves.easeOut),
              const SizedBox(height: 60),

              ResponsiveBuilder(
                builder: (context, sizingInfo) {
                  return Flex(
                    direction:
                        sizingInfo.isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bio
                      Expanded(
                        flex: sizingInfo.isMobile ? 0 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get to know me!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'I am a passionate Flutter developer with expertise in building beautiful and functional mobile and web applications. With a strong foundation in software development principles and a keen eye for design, I strive to create engaging user experiences that make a difference.\n\n'
                              'I have experience working with remote teams, maintaining complex legacy projects, and architecting new scalable solutions from scratch using modern state management and clean architecture.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1.6,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1),
                      ),

                      if (sizingInfo.isMobile)
                        const SizedBox(height: 40)
                      else
                        const SizedBox(width: 60),

                      // Skills
                      Expanded(
                        flex: sizingInfo.isMobile ? 0 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tech Stack & Skills',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                'Flutter',
                                'Dart',
                                'Firebase',
                                'GetX',
                                'Bloc',
                                'REST APIs',
                                'Google Maps',
                                'Sqflite',
                                'UI/UX Design',
                                'Git',
                                'Codemagic',
                                'ShoreBird',
                                'AI Tools',
                              ]
                                  .map((skill) => _SkillChip(skill: skill))
                                  .toList(),
                            )
                                .animate()
                                .fadeIn(delay: 400.ms)
                                .slideX(begin: 0.1),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 80),

              // Experience Timeline
              Text(
                'Experience',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 28),
              ).animate().fadeIn(delay: 500.ms).slideY(),
              const SizedBox(height: 40),

              _ExperienceCard(
                role: 'Flutter Developer',
                company: 'Remote',
                period: '2025 - Present',
                description:
                    'Maintaining old projects and developing new mobile and web applications from scratch with clean architecture.',
                delayMs: 600,
              ),
              const SizedBox(height: 20),
              _ExperienceCard(
                role: 'Freelance Flutter Developer',
                company: 'Self-Employed',
                period: '2023 - Present',
                description:
                    'Collaborated directly with clients to design, build, and deliver full-stack mobile experiences.',
                delayMs: 700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String skill;
  const _SkillChip({required this.skill});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered
              ? Theme.of(context).primaryColor.withOpacity(0.2)
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? Theme.of(context).primaryColor
                : Colors.white.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      blurRadius: 8)
                ]
              : [],
        ),
        child: Text(
          widget.skill,
          style: TextStyle(
            color:
                _isHovered ? Theme.of(context).primaryColor : Colors.grey[300],
            fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final String role;
  final String company;
  final String period;
  final String description;
  final int delayMs;

  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.delayMs,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? Theme.of(context).primaryColor.withOpacity(0.5)
                : Colors.transparent,
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      blurRadius: 20)
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.role,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.period,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.company,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style:
                  TextStyle(fontSize: 15, color: Colors.grey[300], height: 1.5),
            ),
          ],
        ),
      ).animate().fadeIn(delay: widget.delayMs.ms).slideY(begin: 0.2),
    );
  }
}
