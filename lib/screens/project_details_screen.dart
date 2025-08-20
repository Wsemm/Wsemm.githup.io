import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name).animate().fadeIn().slideX(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            LayoutBuilder(
              builder: (context, constraints) {
                final isSmallScreen = constraints.maxHeight < 700;
                return Container(
                  height: isSmallScreen ? 300 : 360,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Stack(
                    children: [
                      // Phone frame
                      Center(
                        child: Container(
                          width: 160,
                          height: 320,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // App screenshot
                      Center(
                        child: Container(
                          width: 154,
                          height: 314,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(38),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38),
                            child: Hero(
                              tag: 'project_${project.id}',
                              child: Image.asset(
                                project.imageUrl,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                cacheWidth: 1080,
                                cacheHeight: 2160,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error_outline, size: 100),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).animate().fadeIn().scale(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Description
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 8),
                  Text(project.description)
                      .animate()
                      .fadeIn(delay: 200.ms)
                      .slideX(),
                  const SizedBox(height: 16),

                  // Technologies Used
                  Text(
                    'Technologies Used',
                    style: Theme.of(context).textTheme.titleLarge,
                  ).animate().fadeIn(delay: 300.ms).slideX(),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.technologies
                        .map((tech) => Chip(
                              label: Text(tech),
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              side: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                              ),
                            ))
                        .toList()
                        .animate(interval: 100.ms)
                        .fadeIn()
                        .scale(),
                  ),
                  const SizedBox(height: 16),

                  // Screenshots
                  Text(
                    'Screenshots',
                    style: Theme.of(context).textTheme.titleLarge,
                  ).animate().fadeIn(delay: 400.ms).slideX(),
                  const SizedBox(height: 8),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxHeight < 700;
                      // Check if we're on web (width > 600)
                      if (constraints.maxWidth > 600) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.5,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                          ),
                          itemCount: project.screenshots.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 180,
                              height: 360,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(38),
                                  child: Image.asset(
                                    project.screenshots[index],
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                    cacheWidth: 1080,
                                    cacheHeight: 2160,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                                .animate(delay: (500 + (index * 100)).ms)
                                .fadeIn()
                                .scale();
                          },
                        );
                      } else {
                        // Mobile layout with horizontal scroll
                        return SizedBox(
                          height: isSmallScreen ? 300 : 360,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: project.screenshots.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: isSmallScreen ? 160 : 180,
                                height: isSmallScreen ? 300 : 360,
                                margin: const EdgeInsets.only(right: 24),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 15,
                                      offset: const Offset(0, 8),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(38),
                                    child: Image.asset(
                                      project.screenshots[index],
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      cacheWidth: 1080,
                                      cacheHeight: 2160,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey[200],
                                          child: const Center(
                                            child: Icon(
                                              Icons.error_outline,
                                              size: 40,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                                  .animate(delay: (500 + (index * 100)).ms)
                                  .fadeIn()
                                  .scale();
                            },
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Project Link
                  if (project.projectUrl != null) ...[
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          var url = project.projectUrl!;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          }
                        },
                        icon: const Icon(Icons.link),
                        label: const Text('View Project'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ).animate().fadeIn(delay: 600.ms).scale(),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
