import 'package:amir_website/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  final List<Project> projects = const [
    Project(
      name: 'Smart Label',
      imagePath: 'assets/images/smart_label.png',
      githubUrl: 'https://github.com/AmirKhairy/SmartLabel',
    ),
    Project(
      name: 'AttendEase',
      imagePath: 'assets/images/attend_ease.png',
      githubUrl: 'https://github.com/AmirKhairy/AttendEase',
    ),
    Project(
      name: 'E-commerce App',
      imagePath: 'assets/images/e_commerce.png',
      githubUrl: 'https://github.com/AmirKhairy/Shop-App-Flutter',
      linkedInUrl:
          'https://www.linkedin.com/posts/amir-khairy-35ba06291_flutter-dart-statemanagement-activity-7293760657965916160-rFE7?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEbOcncBrWXkbystPnInBqk7wVf7eIkWgqQ',
    ),
    Project(
      name: 'Chat App',
      imagePath: 'assets/images/chat.png',
      githubUrl: 'https://github.com/AmirKhairy/chat-app',
      linkedInUrl:
          'https://www.linkedin.com/posts/amir-khairy-35ba06291_flutter-dart-chatapp-activity-7304308967646674944-1nHb?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEbOcncBrWXkbystPnInBqk7wVf7eIkWgqQ',
    ),
    Project(
      name: 'News App',
      imagePath: 'assets/images/news.png',
      githubUrl: 'https://github.com/AmirKhairy/News-App-Flutter',
      linkedInUrl:
          'https://www.linkedin.com/posts/amir-khairy-35ba06291_flutter-dart-statemanagement-activity-7292298457615114241-Rvuo?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEbOcncBrWXkbystPnInBqk7wVf7eIkWgqQ',
    ),
    Project(
      name: 'Weather App',
      imagePath: 'assets/images/weather.png',
      githubUrl: 'https://github.com/AmirKhairy/weather-app',
      linkedInUrl:
          'https://www.linkedin.com/posts/amir-khairy-35ba06291_flutter-dart-weatherapp-activity-7298779735004749824-Z5wY?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEbOcncBrWXkbystPnInBqk7wVf7eIkWgqQ',
    ),
    Project(
      name: 'Todo App',
      imagePath: 'assets/images/todo.png',
      githubUrl: 'https://github.com/AmirKhairy/Todo-App-Flutter',
      linkedInUrl:
          'https://www.linkedin.com/posts/amir-khairy-35ba06291_flutter-dart-statemanagement-activity-7291818869608837120-719x?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEbOcncBrWXkbystPnInBqk7wVf7eIkWgqQ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: buildLayout(context, crossAxisCount: 3),
      tablet: buildLayout(context, crossAxisCount: 2),
      mobile: buildLayout(context, crossAxisCount: 1),
    );
  }

  Widget buildLayout(BuildContext context, {required int crossAxisCount}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Portfolio
          AnimationConfiguration.staggeredList(
            position: 0,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: const Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Projects
          AnimationLimiter(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 32,
                childAspectRatio: 2.2,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 900),
                  columnCount: crossAxisCount,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ProjectCard(project: project),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String name;
  final String imagePath;
  final String githubUrl;
  final String? linkedInUrl;

  const Project({
    required this.name,
    required this.imagePath,
    required this.githubUrl,
    this.linkedInUrl,
  });
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              widget.project.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isHovering ? 1.0 : 0.0,
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: Center(
                  child: Wrap(
                    spacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                        tooltip: 'GitHub',
                        iconSize: 32,
                        onPressed: () =>
                            launchUrl(Uri.parse(widget.project.githubUrl)),
                      ),
                      if (widget.project.linkedInUrl != null)
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                          ),
                          tooltip: 'LinkedIn',
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () =>
                              launchUrl(Uri.parse(widget.project.linkedInUrl!)),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.project.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
