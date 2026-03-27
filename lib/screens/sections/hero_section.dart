import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onContactTap;

  const HeroSection({super.key, this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text Content
                  Expanded(
                    flex: isMobile ? 0 : 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          "HI, I'M WSEM",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: isMobile ? 32 : 48,
                                letterSpacing: 2.0,
                              ),
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                        )
                            .animate()
                            .fadeIn(duration: 800.ms)
                            .slideY(begin: 0.3, end: 0),
                        const SizedBox(height: 16),
                        DefaultTextStyle(
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: isMobile ? 28 : 56,
                                color: Colors.white,
                              ),
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText('Software Engineer',
                                  speed: const Duration(milliseconds: 100)),
                              TypewriterAnimatedText('Flutter Developer',
                                  speed: const Duration(milliseconds: 100)),
                              TypewriterAnimatedText('Freelancer',
                                  speed: const Duration(milliseconds: 100)),
                            ],
                            repeatForever: true,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Passionate about building beautiful, functional, and scalable applications. "
                          "Let's build something amazing together.",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile ? 16 : 18,
                                    height: 1.5,
                                  ),
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                        )
                            .animate()
                            .fadeIn(delay: 400.ms, duration: 800.ms)
                            .slideX(begin: -0.1, end: 0),
                        const SizedBox(height: 40),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          alignment: isMobile
                              ? WrapAlignment.center
                              : WrapAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: onContactTap ?? () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Get in touch'),
                            ),
                            OutlinedButton(
                              onPressed: () async {
                                final Uri url = Uri.parse('assets/cv.pdf');
                                try {
                                  // canLaunchUrl often evaluates to false for relative local assets
                                  // without a scheme (like http://), so we launch it directly.
                                  await launchUrl(
                                    url,
                                    webOnlyWindowName: '_blank',
                                  );
                                } catch (e) {
                                  debugPrint('Could not launch resumé: $e');
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('View Resumé'),
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn(delay: 600.ms, duration: 800.ms)
                            .slideY(begin: 0.2, end: 0),
                      ],
                    ),
                  ),
                  if (isMobile) const SizedBox(height: 60),
                  // Image Content
                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: Container(
                      alignment:
                          isMobile ? Alignment.center : Alignment.centerRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Glowing orb effect
                          Container(
                            width: isMobile ? 250 : 350,
                            height: isMobile ? 250 : 350,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  blurRadius: 100,
                                  spreadRadius: 20,
                                ),
                              ],
                            ),
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .shimmer(
                                  duration: 3000.ms,
                                  color: Colors.blueAccent.withOpacity(0.5)),

                          // Profile Image
                          ClipOval(
                            child: Container(
                              width: isMobile ? 260 : 380,
                              height: isMobile ? 260 : 380,
                              color: Theme.of(context).canvasColor,
                              padding: const EdgeInsets.all(8),
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/wsem2.png",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    color: Colors.grey[800],
                                    child: Icon(Icons.person,
                                        size: isMobile ? 100 : 150,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                          .animate()
                          .fadeIn(delay: 500.ms, duration: 1.seconds)
                          .scale(
                              begin: const Offset(0.8, 0.8),
                              curve: Curves.easeOutBack),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
