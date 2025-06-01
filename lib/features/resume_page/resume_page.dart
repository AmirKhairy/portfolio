import 'package:amir_website/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: buildDesktopLayout(context),
      mobile: buildMobileLayout(context),
      tablet: buildTabletLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 900),
          delay: const Duration(milliseconds: 200),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            Text(
              'Resume',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        buildSummarySection(context),
                        SizedBox(height: 20),
                        buildEducationSection(context),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        buildExperienceSection(context),
                        SizedBox(height: 20),
                        buildLanguagesSection(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 900),
          delay: const Duration(milliseconds: 200),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            Text(
              'Resume',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        buildSummarySection(context),
                        SizedBox(height: 20),
                        buildEducationSection(context),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        buildExperienceSection(context),
                        SizedBox(height: 20),
                        buildLanguagesSection(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 900),
          delay: const Duration(milliseconds: 200),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            Text(
              'Resume',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      buildSummarySection(context),
                      SizedBox(height: 20),
                      buildEducationSection(context),
                      SizedBox(height: 20),
                      buildExperienceSection(context),
                      SizedBox(height: 20),
                      buildLanguagesSection(context),
                    ],
                  ),
                  Column(
                    children: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummarySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        IntrinsicHeight(
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amir Khairy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Flutter developer passionate about building high-performance mobile apps. Experience in prompt engineering at Outlier and developed two full-featured mobile applications from scratch. Seeking an opportunity to contribute and grow in a fast-paced development team.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '• Tanta, Al Gharbeia, Egypt\n\n• (+20) 1206082636\n\n• amirkhairy903@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEducationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        IntrinsicHeight(
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TANTA UNIVERSITY, FACULTY OF COMPUTERS AND INFORMATION',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '• Major: Computer Science\n\n• GPA: 3.55\n\n• Expected Graduation: [2026]',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildExperienceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience & Projects',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        IntrinsicHeight(
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prompt Engineer – Outlier (Freelance / Remote)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ' Dec 2024 - Now\n\n• Crafted prompt structures for generative AI systems to deliver consistent, accurate outputs.\n\n• Collaborated with internal teams to refine outputs and improve user prompt interaction.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Basmty (Freelance)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '• Developed a mobile application for secure and efficient attendance tracking using fingerprint authentication via local device biometrics.\n\n• Ensured data accuracy and privacy by storing attendance logs securely and locally, with optional cloud sync support.\n\n• Improved organizational attendance workflows by reducing check-in time and eliminating identity fraud.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLanguagesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Languages',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        IntrinsicHeight(
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Arabic',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '   Native',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'English',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '   Intermediate',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
