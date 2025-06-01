import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          vertical: 40, horizontal: 20), 
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 900), 
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 900),
                delay: const Duration(milliseconds: 200),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  // About Section
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Flutter developer passionate about building high-performance mobile apps. Experience in prompt engineering at Outlier and developed two full-featured mobile applications from scratch. Seeking an opportunity to contribute and grow in a fast-paced development team.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Info Section
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isMobile = constraints.maxWidth < 600;
                      return Flex(
                        direction: isMobile ? Axis.vertical : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isMobile ? 0 : 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Flutter Developer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                SizedBox(height: 10),
                                InfoRow(title: 'Birthday: 20 Dec 2003'),
                                InfoRow(title: 'Phone: +20 01206082636'),
                                InfoRow(title: 'City: Tanta, Egypt'),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: isMobile ? 0 : 50,
                              height: isMobile ? 30 : 0),
                          Expanded(
                            flex: isMobile ? 0 : 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(height: 80),
                                InfoRow(title: 'Age: 21'),
                                InfoRow(title: 'Degree: Bachelor\'s'),
                                InfoRow(
                                    title: 'Email: amirkhairy903@gmail.com'),
                                InfoRow(title: 'Freelance: Available'),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  // Skills Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          'SKILLS',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                        Text(
                          '   _________________',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 50, 119, 179),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'My SKILLS',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        _buildSkillChip('Flutter'),
                        _buildSkillChip('Dart'),
                        _buildSkillChip('State Management'),
                        _buildSkillChip('Bloc, Cubit'),
                        _buildSkillChip('REST APIs'),
                        _buildSkillChip('Firebase, Supabase'),
                        _buildSkillChip('SQFlite, Shared Preferences'),
                        _buildSkillChip('Git, GitHub'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(
        skill,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 61, 144, 215),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          FaIcon(
            size: 15,
            FontAwesomeIcons.arrowRight,
            color: const Color.fromARGB(255, 61, 144, 215),
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
