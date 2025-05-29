import 'package:amir_website/core/responsive_helper.dart';
import 'package:amir_website/cubits/app_cubit.dart';
import 'package:amir_website/cubits/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(context, cubit),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: cubit.mainScreens[cubit.currentIndex],
                ),
                buildFooter(context, cubit),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildFooter(BuildContext context, AppCubit cubit) {
    bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      color: const Color.fromARGB(255, 15, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Flutter developer with a passion for innovation.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 20 : 35,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'From idea to execution — I turn concepts into fully working systems with precision and passion.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontStyle: FontStyle.italic,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              UrlButton(
                icon: FontAwesomeIcons.linkedin,
                onTap: () => cubit.openUrl(
                    'https://www.linkedin.com/in/amir-khairy-35ba06291/'),
              ),
              UrlButton(
                icon: FontAwesomeIcons.github,
                onTap: () => cubit.openUrl('https://github.com/AmirKhairy'),
              ),
              UrlButton(
                icon: FontAwesomeIcons.facebook,
                onTap: () =>
                    cubit.openUrl('https://web.facebook.com/amir.khairy.9256'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context, AppCubit cubit) {
    bool isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return Positioned(
        top: 20,
        left: 20,
        right: 20,
        child: Column(
          children: [
            Text(
              'Amir Khairy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: [
                for (var i = 0; i < 5; i++)
                  AppBarButton(
                    title: [
                      'Home',
                      'About',
                      'Resume',
                      'Portfolio',
                      'Contact'
                    ][i],
                    onTap: () => cubit.changeIndex(i),
                  ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Row(
          children: [
            const Text(
              'Amir Khairy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            for (var i = 0; i < 5; i++)
              AppBarButton(
                title: ['Home', 'About', 'Resume', 'Portfolio', 'Contact'][i],
                onTap: () => cubit.changeIndex(i),
              ),
          ],
        ),
      );
    }
  }
}

class UrlButton extends StatelessWidget {
  const UrlButton({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.hovered)
              ? const Color.fromARGB(255, 76, 162, 237)
              : const Color.fromARGB(255, 61, 144, 215),
        ),
      ),
      onPressed: onTap,
      icon: FaIcon(icon, color: Colors.black),
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.hovered)
              ? const Color.fromARGB(255, 61, 144, 215)
              : Colors.white,
        ),
      ),
      child: Text(title, style: const TextStyle(fontSize: 15)),
    );
  }
}
