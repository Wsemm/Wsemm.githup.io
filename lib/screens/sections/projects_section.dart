import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../controllers/project_controller.dart';
import '../../models/project_model.dart';
import '../project_details_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController = Get.put(ProjectController());

    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Projects',
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
              
              Obx(() {
                if (projectController.projects.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ResponsiveBuilder(
                  builder: (context, sizingInfo) {
                    int crossAxisCount = 3;
                    if (sizingInfo.isMobile) crossAxisCount = 1;
                    if (sizingInfo.isTablet) crossAxisCount = 2;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 0.75, // Adjust based on design
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                      ),
                      itemCount: projectController.projects.length,
                      itemBuilder: (context, index) {
                        final project = projectController.projects[index];
                        return _PremiumProjectCard(
                          project: project,
                          delayMs: 300 + (index * 100),
                        );
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _PremiumProjectCard extends StatefulWidget {
  final Project project;
  final int delayMs;

  const _PremiumProjectCard({required this.project, required this.delayMs});

  @override
  State<_PremiumProjectCard> createState() => _PremiumProjectCardState();
}

class _PremiumProjectCardState extends State<_PremiumProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => Get.to(() => ProjectDetailsScreen(project: widget.project)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered 
                  ? Theme.of(context).primaryColor 
                  : Colors.white.withOpacity(0.05),
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Container
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Backdrop fallback
                      Container(color: Colors.grey[900]),
                      Hero(
                        tag: widget.project.imageUrl,
                        child: AnimatedScale(
                          scale: _isHovered ? 1.05 : 1.0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                widget.project.imageUrl,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error_outline, size: 50, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Overlay gradient
                      if (_isHovered)
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Theme.of(context).canvasColor,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ).animate().fadeIn(duration: 200.ms),
                    ],
                  ),
                ),
              ),
              // Details Container
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Mock description, you can add it to Project model if desired
                      Text(
                        'A comprehensive solution showcasing modern UI/UX principles and robust back-end integration.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      // Tech Stack Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.project.technologies.take(3).map((tech) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: widget.delayMs.ms).slideY(begin: 0.2),
      ),
    );
  }
}
