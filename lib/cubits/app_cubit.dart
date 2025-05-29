import 'package:amir_website/cubits/app_states.dart';
import 'package:amir_website/features/about_page/about_page.dart';
import 'package:amir_website/features/contact_page/contact_page.dart';
import 'package:amir_website/features/home_page/home_page.dart';
import 'package:amir_website/features/portfolio_page/portfolio_page.dart';
import 'package:amir_website/features/resume_page/resume_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> mainScreens = [
    const HomePage(),
    const AboutPage(),
    const ResumePage(),
    const PortfolioPage(),
    const ContactPage(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangePagesIndexState());
  }

  void openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
