import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me').animate().fadeIn().slideX(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/200'),
                    ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms),
                    const SizedBox(height: 16),
                    Text(
                      'Your Name',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ).animate().fadeIn().slideY(delay: 400.ms),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter Developer',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ).animate().fadeIn().slideY(delay: 500.ms),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // About Section
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineSmall,
              ).animate().fadeIn().slideX(delay: 600.ms),
              const SizedBox(height: 16),
              const Text(
                'I am a passionate Flutter developer with expertise in building beautiful and functional mobile and web applications. With a strong foundation in software development principles and a keen eye for design, I strive to create engaging user experiences that make a difference.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ).animate().fadeIn().slideX(delay: 700.ms),
              const SizedBox(height: 32),

              // Skills Section
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headlineSmall,
              ).animate().fadeIn().slideX(delay: 800.ms),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'Flutter',
                  'Dart',
                  'Firebase',
                  'GetX',
                  'REST APIs',
                  'Git',
                  'UI/UX Design',
                ]
                    .map((skill) => Chip(
                          label: Text(skill),
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                        )
                            .animate()
                            .fadeIn()
                            .scale(delay: (900 + (skill.length * 50)).ms))
                    .toList(),
              ),
              const SizedBox(height: 32),

              // Experience Section
              Text(
                'Experience',
                style: Theme.of(context).textTheme.headlineSmall,
              ).animate().fadeIn().slideX(delay: 1000.ms),
              const SizedBox(height: 16),
              _buildExperienceItem(
                context,
                'Senior Flutter Developer',
                'Company Name',
                '2020 - Present',
                'Led the development of multiple Flutter applications, implemented best practices, and mentored junior developers.',
              ).animate().fadeIn().slideX(delay: 1100.ms),
              const SizedBox(height: 16),
              _buildExperienceItem(
                context,
                'Flutter Developer',
                'Previous Company',
                '2018 - 2020',
                'Developed and maintained mobile applications using Flutter, collaborated with cross-functional teams.',
              ).animate().fadeIn().slideX(delay: 1200.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context,
    String title,
    String company,
    String period,
    String description,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              company,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              period,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
