import 'package:amir_website/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: buildDesktopLayout(context),
      tablet: buildTabletLayout(context),
      mobile: buildMobileLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 900),
                delay: const Duration(milliseconds: 200),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Feel free to reach out to me at any time.',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactItem(
                            icon: FontAwesomeIcons.mapMarkerAlt,
                            label: 'Address',
                            value: 'Tanta, Egypt',
                          ),
                          const SizedBox(height: 48),
                          _buildContactItem(
                            icon: FontAwesomeIcons.message,
                            label: 'Email',
                            value: 'amirkhairy903@gmail.com',
                          ),
                        ],
                      ),
                      const SizedBox(width: 120),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactItem(
                            icon: FontAwesomeIcons.whatsapp,
                            label: 'WhatsApp',
                            value: '+201206082636',
                            url: 'https://wa.me/201206082636',
                          ),
                          const SizedBox(height: 48),
                          _buildSocialItem(
                            icon: FontAwesomeIcons.shareNodes,
                            label: 'Social Profiles',
                            icons: [
                              FontAwesomeIcons.linkedin,
                              FontAwesomeIcons.github,
                              FontAwesomeIcons.facebook,
                            ],
                            urls: [
                              'https://www.linkedin.com/in/amir-khairy/',
                              'https://github.com/AmirKhairy',
                              'https://web.facebook.com/amir.khairy.9256',
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 900),
                delay: const Duration(milliseconds: 200),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Feel free to reach out to me at any time.',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactItem(
                            icon: FontAwesomeIcons.mapMarkerAlt,
                            label: 'Address',
                            value: 'Tanta, Egypt',
                          ),
                          const SizedBox(height: 48),
                          _buildContactItem(
                            icon: FontAwesomeIcons.message,
                            label: 'Email',
                            value: 'amirkhairy903@gmail.com',
                          ),
                        ],
                      ),
                      const SizedBox(width: 120), // space between columns

                      // Right Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactItem(
                            icon: FontAwesomeIcons.whatsapp,
                            label: 'WhatsApp',
                            value: '+201206082636',
                            url: 'https://wa.me/201206082636',
                          ),
                          const SizedBox(height: 48),
                          _buildSocialItem(
                            icon: FontAwesomeIcons.shareNodes,
                            label: 'Social Profiles',
                            icons: [
                              FontAwesomeIcons.linkedin,
                              FontAwesomeIcons.github,
                              FontAwesomeIcons.facebook,
                            ],
                            urls: [
                              'https://www.linkedin.com/in/amir-khairy/',
                              'https://github.com/AmirKhairy',
                              'https://web.facebook.com/amir.khairy.9256',
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 900),
                delay: const Duration(milliseconds: 200),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Feel free to reach out to me at any time.',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 80),
                  _buildContactItem(
                    icon: FontAwesomeIcons.mapMarkerAlt,
                    label: 'Address',
                    value: 'Tanta, Egypt',
                  ),
                  const SizedBox(height: 10),
                  _buildContactItem(
                    icon: FontAwesomeIcons.message,
                    label: 'Email',
                    value: 'amirkhairy903@gmail.com',
                  ),
                  const SizedBox(height: 10),
                  _buildContactItem(
                    icon: FontAwesomeIcons.whatsapp,
                    label: 'WhatsApp',
                    value: '+201206082636',
                    url: 'https://wa.me/201206082636',
                  ),
                  const SizedBox(height: 10),
                  _buildSocialItem(
                    icon: FontAwesomeIcons.shareNodes,
                    label: 'Social Profiles',
                    icons: [
                      FontAwesomeIcons.linkedin,
                      FontAwesomeIcons.github,
                      FontAwesomeIcons.facebook,
                    ],
                    urls: [
                      'https://www.linkedin.com/in/amir-khairy/',
                      'https://github.com/AmirKhairy',
                      'https://web.facebook.com/amir.khairy.9256',
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    String? url,
  }) {
    return GestureDetector(
      onTap: url != null ? () => _launchUrl(url) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blue,
            child: FaIcon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialItem({
    required IconData icon,
    required String label,
    required List<IconData> icons,
    required List<String> urls,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blueAccent,
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: List.generate(icons.length, (index) {
                return IconButton(
                  icon: FaIcon(icons[index]),
                  color: Colors.white70,
                  onPressed: () => _launchUrl(urls[index]),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
