import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/project_controller.dart';
import '../models/project_model.dart';
import 'project_details_screen.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController = Get.put(ProjectController());
    final widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
      ),
      body: Obx(() => GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widthSize < 600
                  ? 2
                  : widthSize < 1050
                      ? 3
                      : 5,
              childAspectRatio: widthSize < 600
                  ? 0.36
                  : widthSize < 1050
                      ? 0.47
                      : 0.55,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: projectController.projects.length,
            itemBuilder: (context, index) {
              final project = projectController.projects[index];
              return ProjectCard(project: project);
            },
          )),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Get.to(() => ProjectDetailsScreen(project: project)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: widthSize > 1270 ? 4 : 3,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Phone frame
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.008,
                            vertical: Get.height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Hero(
                            tag: project.imageUrl,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Image.asset(
                                project.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error_outline, size: 50),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // App screenshot
                      // Center(
                      //   child: Container(
                      //     margin: const EdgeInsets.all(2),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(18),
                      //     ),
                      //     child: Hero(
                      //       tag: project.imageUrl,
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(9),
                      //         child: Image.asset(
                      //           project.imageUrl,
                      //           fit: BoxFit.cover,
                      //           errorBuilder: (context, error, stackTrace) {
                      //             return const Center(
                      //               child: Icon(Icons.error_outline, size: 50),
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      alignment: WrapAlignment.center,
                      children: project.technologies
                          .map<Widget>((tech) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  tech,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ))
                          .toList(),
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
}
