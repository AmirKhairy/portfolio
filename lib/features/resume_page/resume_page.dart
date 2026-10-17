import 'package:amir_website/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  static const blue = Color.fromARGB(255, 61, 144, 215);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _buildLayout(2),
      tablet: _buildLayout(2),
      mobile: _buildLayout(1),
    );
  }

  Widget _buildLayout(int columns) {
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 700),
            delay: const Duration(milliseconds: 100),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 30,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const Text('Resume', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => launchUrl(Uri.parse('assets/Amir_Khairy_Khalil_CV.pdf')),
                icon: const Icon(Icons.download),
                label: const Text('Download Resume'),
                style: OutlinedButton.styleFrom(foregroundColor: blue, side: const BorderSide(color: blue)),
              ),
              const SizedBox(height: 28),
              columns == 1
                  ? Column(children: _sections())
                  : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(child: Column(children: [_summary(), const SizedBox(height: 24), _education(), const SizedBox(height: 24), _skills()])),
                      const SizedBox(width: 24),
                      Expanded(child: Column(children: [_experience(), const SizedBox(height: 24), _projects(), const SizedBox(height: 24), _additional()])),
                    ]),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _sections() => [_summary(), const SizedBox(height: 24), _experience(), const SizedBox(height: 24), _projects(), const SizedBox(height: 24), _education(), const SizedBox(height: 24), _skills(), const SizedBox(height: 24), _additional()];

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 15, 15, 15), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 22, color: blue, fontWeight: FontWeight.bold)), const SizedBox(height: 14), child]),
      );

  Widget _summary() => _card('Professional Summary', const Text('Junior Flutter Developer and Software Engineer with 1+ year of professional experience building production-ready cross-platform Android and iOS applications with Flutter and Dart. Published two apps on the App Store and Google Play. Strong in GetX, BLoC/Cubit, Clean Architecture, MVVM, Firebase, Supabase, RESTful APIs, and SignalR. Graduation project graded A+.', style: TextStyle(color: Colors.white, height: 1.5)));

  Widget _experience() => _card('Work Experience', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _heading('Flutter Developer (Full-Time) | Designinsta', '12/2025 - Present'),
        _body('Develop and maintain production Flutter applications for Android and iOS. Translate Figma designs into responsive UIs, architect features with GetX, integrate Firebase Authentication, Firestore, and FCM, and refactor code for performance and maintainability. Collaborate in Agile teams using Git, branching strategies, pull requests, and code reviews. Use AI coding agents with custom rules and sub-agents, reviewing all generated code.'),
        const SizedBox(height: 16),
        _heading('Flutter Developer (Intern) | Designinsta', '09/2025 - 12/2025'),
        _body('Built production-grade Flutter features under mentorship, applying GetX for state management, routing, dependency injection, Firebase Authentication, and Firestore real-time synchronization.'),
      ]));

  Widget _projects() => _card('Selected Projects', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _heading('Qatra (قطرة) - Water Donation Platform', 'Published on App Store & Google Play'),
        _body('Flutter, Dart, GetX, Firebase, payment integration. Built an app for purchasing water and donating it to mosques, with Moyasar payments and real-time delivery tracking.'),
        const SizedBox(height: 12),
        _heading('Qatra Captain (قطرة كابتن) - Delivery Driver App', 'Published on App Store & Google Play'),
        _body('Flutter, Dart, GetX, Firebase. Built real-time order assignment, delivery status workflows, and photo/video proof of delivery.'),
        const SizedBox(height: 12),
        _heading('Farm IQ - Smart Cattle Management App', 'Graduation Project (A+)'),
        _body('Flutter, GetX, REST API, SignalR, FCM, Dio. Built role-based farm management with live cattle telemetry, AI alerts, JWT authentication, and SignalR team chat.'),
        const SizedBox(height: 12),
        _heading('Smart Label - E-Commerce App', 'College Project'),
        _body('Flutter, BLoC/Cubit, REST API, MVVM, Clean Architecture. Built product browsing, cart management, instant price updates, and an admin dashboard.'),
        const SizedBox(height: 12),
        _heading('Basmty - Employee Attendance Tracker', 'Freelance'),
        _body('Flutter, biometric authentication, local network, SQLite. Built secure fingerprint check-in/check-out with local-network-only communication.'),
      ]));

  Widget _education() => _card('Education', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _heading('B.Sc. in Computer Science | Tanta University, Egypt', '09/2022 - 06/2026'),
        _body('GPA: 3.44 / 4.0 (B+)\nGraduation Project: A+'),
      ]));

  Widget _skills() => _card('Technical Skills', const Text('Dart, Flutter SDK, Flutter Web, BLoC, Cubit, GetX, Clean Architecture, MVVM, MVC, Repository Pattern, Firebase, Supabase, REST APIs, Dio, JWT, SignalR, SQLite, Hive, Shared Preferences, FCM, local notifications, responsive UI, localization, payment integration, biometric authentication, WebView, unit testing, Git, GitHub, CI/CD, Agile, Postman, Android Studio, VS Code, Figma, agentic coding.', style: TextStyle(color: Colors.white, height: 1.5)));

  Widget _additional() => _card('Certifications & Languages', const Text('AI for Developers: Master Agentic Coding the Right Way - Udemy\nFlutter Training - ITI (07/2025 - 08/2025)\niSUPPLY Hackathon 2.0 (06/2025 - 07/2025)\nNext Summit - iCareer 2026\n\nArabic: Native\nEnglish: Professional working proficiency', style: TextStyle(color: Colors.white, height: 1.6)));

  Widget _heading(String title, String subtitle) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: blue, fontStyle: FontStyle.italic))]);

  Widget _body(String text) => Padding(padding: const EdgeInsets.only(top: 8), child: Text(text, style: const TextStyle(color: Colors.white70, height: 1.45)));
}
