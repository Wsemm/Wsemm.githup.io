import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me').animate().fadeIn().slideX(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact Information
              Text(
                'Get in Touch',
                style: Theme.of(context).textTheme.headlineMedium,
              ).animate().fadeIn().slideX(),
              const SizedBox(height: 8),
              Text(
                'Feel free to reach out to me for any questions or opportunities.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ).animate().fadeIn().slideX(delay: 200.ms),
              const SizedBox(height: 32),

              // Contact Form
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Send Message',
                          style: Theme.of(context).textTheme.titleLarge,
                        ).animate().fadeIn().slideX(),
                        const SizedBox(height: 24),
                        _buildTextField(
                          controller: nameController,
                          label: 'Name',
                          hint: 'Your name',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ).animate().fadeIn().slideX(delay: 100.ms),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: emailController,
                          label: 'Email',
                          hint: 'Your email',
                          icon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ).animate().fadeIn().slideX(delay: 200.ms),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: subjectController,
                          label: 'Subject',
                          hint: 'Message subject',
                          icon: Icons.subject,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a subject';
                            }
                            return null;
                          },
                        ).animate().fadeIn().slideX(delay: 300.ms),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: messageController,
                          label: 'Message',
                          hint: 'Your message',
                          icon: Icons.message,
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                        ).animate().fadeIn().slideX(delay: 400.ms),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'wsem.dawoodi2001@gmail.com',
                                  queryParameters: {
                                    'subject': subjectController.text,
                                    'body': '''
Name: ${nameController.text}
Email: ${emailController.text}

${messageController.text}
''',
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
                                  );
                                } catch (e) {
                                  Get.snackbar(
                                    'Error',
                                    'Could not open email client',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Send Message'),
                          ),
                        ).animate().fadeIn().slideX(delay: 500.ms),
                      ],
                    ),
                  ),
                ),
              ).animate().fadeIn().slideY(delay: 300.ms),
              const SizedBox(height: 32),

              // Social Media Links
              Text(
                'Connect with Me',
                style: Theme.of(context).textTheme.titleLarge,
              ).animate().fadeIn().slideX(delay: 400.ms),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    icon: Icons.link,
                    label: 'LinkedIn',
                    onTap: () async {
                      const url = 'https://linkedin.com/in/your-profile';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                  ).animate().fadeIn().slideY(delay: 500.ms),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: Icons.code,
                    label: 'GitHub',
                    onTap: () async {
                      const url = 'https://github.com/your-username';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                  ).animate().fadeIn().slideY(delay: 600.ms),
                  const SizedBox(width: 16),
                  _buildSocialButton(
                    icon: Icons.mail,
                    label: 'Email',
                    onTap: () async {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'your.email@example.com',
                      );
                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      }
                    },
                  ).animate().fadeIn().slideY(delay: 700.ms),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 24,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
