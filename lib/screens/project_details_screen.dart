import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portofolio/core/constant/app_images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../models/project_model.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(project.name,
                style: const TextStyle(fontWeight: FontWeight.bold))
            .animate()
            .fadeIn()
            .slideX(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Image Container
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: AssetImage(project.imageUrl),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.15),
                          blurRadius: 30,
                          spreadRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor,
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.4],
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .scale(begin: const Offset(0.95, 0.95)),

                  const SizedBox(height: 40),

                  // Main Content Layout
                  ResponsiveBuilder(
                    builder: (context, sizingInfo) {
                      return Flex(
                        direction: sizingInfo.isMobile
                            ? Axis.vertical
                            : Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left column (Description & Screenshots)
                          Expanded(
                            flex: sizingInfo.isMobile ? 0 : 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Overview',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ).animate().fadeIn(delay: 200.ms).slideX(),
                                const SizedBox(height: 16),
                                Text(
                                  project.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.6,
                                    color: Colors.grey[300],
                                  ),
                                ).animate().fadeIn(delay: 300.ms).slideX(),
                                const SizedBox(height: 48),
                                Text(
                                  'Screenshots',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ).animate().fadeIn(delay: 400.ms).slideX(),
                                const SizedBox(height: 24),
                                _buildScreenshotsGallery(
                                    context, sizingInfo.isMobile),
                              ],
                            ),
                          ),

                          if (sizingInfo.isMobile)
                            const SizedBox(height: 40)
                          else
                            const SizedBox(width: 48),

                          // Right column (Tech Stack & Links)
                          Expanded(
                            flex: sizingInfo.isMobile ? 0 : 1,
                            child: Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Theme.of(context).canvasColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.05)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Technologies',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 16),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: project.technologies
                                        .map((tech) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.3)),
                                              ),
                                              child: Text(
                                                tech,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                  const SizedBox(height: 32),
                                  const Divider(color: Colors.white12),
                                  const SizedBox(height: 32),
                                  Text(
                                    'Links & Resources',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 16),
                                  if (project.projectUrl != null) ...[
                                    _buildLinkButton(
                                      context,
                                      'Project Code',
                                      Icons.language,
                                      project.projectUrl!,
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                  if (project.projectPlayStoreUrl != null)
                                    _buildLinkButton(
                                      context,
                                      'Google Play',
                                      Icons.shop,
                                      project.projectPlayStoreUrl!,
                                      isPlayStore: true,
                                    ),
                                ],
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 500.ms)
                                .slideY(begin: 0.1),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenshotsGallery(BuildContext context, bool isMobile) {
    if (project.screenshots.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text('No screenshots available',
              style: TextStyle(color: Colors.grey)),
        ),
      );
    }

    if (isMobile) {
      return SizedBox(
        height: 360,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: project.screenshots.length,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
                image: DecorationImage(
                  image: AssetImage(project.screenshots[index]),
                  fit: BoxFit.cover,
                ),
              ),
            )
                .animate()
                .fadeIn(delay: (400 + index * 100).ms)
                .slideX(begin: 0.2);
          },
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.45,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: project.screenshots.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(project.screenshots[index]),
              fit: BoxFit.cover,
            ),
          ),
        )
            .animate()
            .fadeIn(delay: (400 + index * 100).ms)
            .scale(begin: const Offset(0.9, 0.9));
      },
    );
  }

  Widget _buildLinkButton(
      BuildContext context, String title, IconData icon, String url,
      {bool isPlayStore = false}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
        icon: isPlayStore
            ? Image.asset(AppImages.google, width: 24, height: 24)
            : Icon(icon, size: 24),
        label: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPlayStore ? Colors.black : Theme.of(context).primaryColor,
          foregroundColor: isPlayStore ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isPlayStore
                ? BorderSide(color: Colors.grey[800]!)
                : BorderSide.none,
          ),
          elevation: isPlayStore ? 0 : 4,
        ),
      ),
    );
  }
}
