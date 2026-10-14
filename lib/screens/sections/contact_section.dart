import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();
    final formKey = GlobalKey<FormState>();

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
                'Get in Touch',
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
              const SizedBox(height: 16),
              Text(
                "Have a project in mind or just want to say hi? I'd love to hear from you.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 300.ms),
              const SizedBox(height: 60),
              ResponsiveBuilder(
                builder: (context, sizingInfo) {
                  return Flex(
                    direction:
                        sizingInfo.isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact Info & Socials
                      Expanded(
                        flex: sizingInfo.isMobile ? 0 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Let's Connect",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 28),
                            ),
                            const SizedBox(height: 32),
                            _ContactInfoRow(
                              icon: Icons.email,
                              title: 'Email',
                              value: 'waseem.dawoodi2001@gmail.com',
                              onTap: () async {
                                final Uri url = Uri(
                                    scheme: 'mailto',
                                    path: 'waseem.dawoodi2001@gmail.com');
                                if (await canLaunchUrl(url))
                                  await launchUrl(url);
                              },
                            ),
                            const SizedBox(height: 24),
                            _ContactInfoRow(
                              icon: Icons.link,
                              title: 'LinkedIn',
                              value: 'Waseem Dawoodi',
                              onTap: () async {
                                final url = Uri.parse(
                                    'https://www.linkedin.com/in/waseem-dawoodi-a604802b3');
                                if (await canLaunchUrl(url))
                                  await launchUrl(url);
                              },
                            ),
                            const SizedBox(height: 24),
                            _ContactInfoRow(
                              icon: Icons.code,
                              title: 'GitHub',
                              value: 'github.com/Wsemm',
                              onTap: () async {
                                final url =
                                    Uri.parse('https://github.com/Wsemm');
                                if (await canLaunchUrl(url))
                                  await launchUrl(url);
                              },
                            ),
                          ],
                        ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1),
                      ),

                      if (sizingInfo.isMobile)
                        const SizedBox(height: 60)
                      else
                        const SizedBox(width: 60),

                      // Form
                      Expanded(
                        flex: sizingInfo.isMobile ? 0 : 2,
                        child: Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.05)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _PremiumTextField(
                                  controller: nameController,
                                  label: 'Your Name',
                                  icon: Icons.person_outline,
                                  validator: (v) => v!.isEmpty
                                      ? 'Please enter your name'
                                      : null,
                                ),
                                const SizedBox(height: 20),
                                _PremiumTextField(
                                  controller: emailController,
                                  label: 'Your Email',
                                  icon: Icons.email_outlined,
                                  validator: (v) => !EmailValidator.validate(v!)
                                      ? 'Enter a valid email'
                                      : null,
                                ),
                                const SizedBox(height: 20),
                                _PremiumTextField(
                                  controller: subjectController,
                                  label: 'Subject',
                                  icon: Icons.subject,
                                  validator: (v) => v!.isEmpty
                                      ? 'Please enter a subject'
                                      : null,
                                ),
                                const SizedBox(height: 20),
                                _PremiumTextField(
                                  controller: messageController,
                                  label: 'Message',
                                  icon: Icons.message_outlined,
                                  maxLines: 5,
                                  validator: (v) => v!.isEmpty
                                      ? 'Please enter a message'
                                      : null,
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        final Uri emailLaunchUri = Uri(
                                          scheme: 'mailto',
                                          path: 'waseem.dawoodi2001@gmail.com',
                                          queryParameters: {
                                            'subject': subjectController.text,
                                            'body':
                                                'Name: ${nameController.text}\nEmail: ${emailController.text}\n\n${messageController.text}',
                                          },
                                        );

                                        try {
                                          await launchUrl(emailLaunchUri);
                                          Get.snackbar(
                                            'Success',
                                            'Email client opened successfully',
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                            margin: const EdgeInsets.all(20),
                                          );
                                        } catch (e) {
                                          Get.snackbar(
                                            'Error',
                                            'Could not open email client',
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                            margin: const EdgeInsets.all(20),
                                          );
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Send Message',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PremiumTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int maxLines;
  final String? Function(String?)? validator;

  const _PremiumTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
              bottom: maxLines > 1 ? (maxLines * 15.0 - 24) : 0),
          child: Icon(icon, color: Colors.grey[500]),
        ),
        alignLabelWithHint: maxLines > 1,
        filled: true,
        fillColor: Theme.of(context).canvasColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
    );
  }
}

class _ContactInfoRow extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactInfoRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<_ContactInfoRow> createState() => _ContactInfoRowState();
}

class _ContactInfoRowState extends State<_ContactInfoRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isHovered
                        ? Theme.of(context).primaryColor
                        : Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: _isHovered
                      ? Colors.black
                      : Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.value,
                    style: TextStyle(
                      fontSize: 16,
                      color: _isHovered
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
