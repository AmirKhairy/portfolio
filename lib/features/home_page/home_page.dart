import 'package:amir_website/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: buildDesktopLayout(context),
      tablet: buildTabletLayout(context),
      mobile: buildMobileLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextSection(context,
            vertical: 300,
            horizontal: 40,
            nameSize: 60,
            titleSize: 30,
            emailSize: 15),
        const Spacer(),
        buildImageSection(context, heightFactor: 1.0),
      ],
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    return Row(
      children: [
        buildTextSection(
          context,
          vertical: 200,
          horizontal: 20,
          nameSize: 45,
          titleSize: 25,
          emailSize: 14,
        ),
        Spacer(),
        buildImageSection(context, heightFactor: 0.8),
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        buildTextSection(
          context,
          vertical: 100,
          horizontal: 20,
          nameSize: 30,
          titleSize: 18,
          emailSize: 13,
        ),
        buildImageSection(context, heightFactor: 1.0),
      ],
    );
  }

  Widget buildTextSection(
    BuildContext context, {
    required double vertical,
    required double horizontal,
    required double nameSize,
    required double titleSize,
    required double emailSize,
  }) {
    return AnimationLimiter(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 1000),
            delay: const Duration(milliseconds: 300),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              Text(
                'Amir Khairy',
                style: TextStyle(
                  fontSize: nameSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'I\'m Flutter Developer',
                style: TextStyle(
                  fontSize: titleSize,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(
                    size: emailSize,
                    FaIcon(FontAwesomeIcons.google).icon,
                    color: const Color.fromARGB(255, 61, 144, 215),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(WidgetState.hovered)) {
                            return const Color.fromARGB(255, 50, 119, 179);
                          }
                          return const Color.fromARGB(255, 61, 144, 215);
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'amirkhairy903@gmail.com',
                      style: TextStyle(fontSize: emailSize),
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

  Widget buildImageSection(BuildContext context,
      {required double heightFactor}) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 1200),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/images/home_image.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * heightFactor,
            ),
          ),
        ),
      ),
    );
  }
}
