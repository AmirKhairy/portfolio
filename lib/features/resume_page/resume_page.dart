import 'package:amir_website/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});
  static const blue = Color.fromARGB(255, 61, 144, 215);

  @override
  Widget build(BuildContext context) => Responsive(
        desktop: _buildLayout(2),
        tablet: _buildLayout(2),
        mobile: _buildLayout(1),
      );

  Widget _buildLayout(int columns) => AnimationLimiter(
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
                  onPressed: () => launchUrl(Uri.parse('assets/Amir_Khairy_Khalil_Flutter_CV.pdf')),
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

  List<Widget> _sections() => [_summary(), const SizedBox(height: 24), _experience(), const SizedBox(height: 24), _projects(), const SizedBox(height: 24), _education(), const SizedBox(height: 24), _skills(), const SizedBox(height: 24), _additional()];

  Widget _card(String title, Widget child) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 15, 15, 15), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 22, color: blue, fontWeight: FontWeight.bold)), const SizedBox(height: 14), child]),
      );

  Widget _summary() => _card('Professional Summary', const Text('Flutter and Dart Developer with a B.Sc. in Computer Science and 1+ year of professional experience shipping production Android and iOS apps. Published 3 apps on the App Store and Google Play. Strong in Flutter, BLoC/Cubit, Clean Architecture, Firebase, RESTful APIs, UI/UX and responsive design, and real-time features with SignalR.', style: TextStyle(color: Colors.white, height: 1.5)));

  Widget _experience() => _card('Professional Experience', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _heading('Flutter Developer | Designinsta', 'Intern, then Full-Time from 12/2025 | 09/2025 - Present'),
        _body('Moved from intern to full-time developer in 3 months, owning feature delivery and production bug fixes on cross-platform Flutter apps using GetX and Firebase. Debug and resolve production issues, including Firebase and deep-link flows, keeping live apps stable. Ship work through Agile sprints with Jira, Git branching, and pull-request code reviews.'),
      ]));

  Widget _projects() => _card('Projects', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _heading('Qatra & Qatra Captain - Water Donation Platform and Driver App', 'App Store & Google Play'),
        _body('Flutter, GetX, Firebase, Moyasar. Shipped 2 apps (customer and driver) to both the App Store and Google Play: users buy water and donate it to mosques, with delivery guaranteed within 24 hours. Integrated Moyasar online payments and real-time order tracking, with photo and video proof of delivery.'),
        const SizedBox(height: 12),
        _heading('Farm IQ - Smart Cattle Management App', 'Graduation Project (A+)'),
        _body('Flutter, GetX, REST API, SignalR, FCM, Dio. Built a 2-role (Admin/Worker) app with live cattle health telemetry charts, AI alerts, JWT auth with automatic token refresh, and real-time team chat with SignalR.'),
        const SizedBox(height: 12),
        _heading('Smart Label - E-Commerce App', 'College Project'),
        _body('Flutter, BLoC/Cubit, MVVM, Clean Architecture, REST API. Built the full shopping flow with product browsing, cart management, instant price updates, and an admin dashboard.'),
        const SizedBox(height: 12),
        _heading('Also: Muzakkir and Basmty', 'Additional projects'),
        _body('Muzakkir: habit tracker using Cubit and local notifications, published on Google Play. Basmty: freelance biometric attendance app using SQLite.'),
      ]));

  Widget _education() => _card('Education', Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _heading('B.Sc. in Computer Science | Tanta University, Egypt', '09/2022 - 06/2026'),
        _body('GPA: 3.44 / 4.0\nGraduation Project: A+'),
      ]));

  Widget _skills() => _card('Technical Skills', const Text('Mobile: Dart, Flutter SDK, Flutter Web, mobile UI/UX, responsive UI, localization (Arabic/English), theming, local and push notifications.\n\nState & Architecture: BLoC, Cubit, GetX, Clean Architecture, MVVM, Repository Pattern.\n\nBackend & Data: RESTful APIs, Dio, JWT, Firebase (Authentication, FCM, Firestore, Realtime Database, Storage, Cloud Functions), Supabase, SignalR, SQLite, Hive.\n\nTools: Git/GitHub, CI/CD, Agile/Jira, Postman, Figma, unit testing, AI-assisted development and code review.', style: TextStyle(color: Colors.white, height: 1.5)));

  Widget _additional() => _card('Education & Training', const Text('Flutter Training, ITI (07/2025 - 08/2025): responsive UIs, Cubit, Hive, Firebase, FCM, and REST APIs.\n\niSUPPLY Hackathon 2.0 (2025): built real-time order tracking, FCM push notifications, and a 4-stage order status lifecycle (Pending, Confirmed, Shipped, Delivered).\n\nLanguages: Arabic (Native), English (Professional working proficiency)', style: TextStyle(color: Colors.white, height: 1.6)));

  Widget _heading(String title, String subtitle) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: blue, fontStyle: FontStyle.italic))]);

  Widget _body(String text) => Padding(padding: const EdgeInsets.only(top: 8), child: Text(text, style: const TextStyle(color: Colors.white70, height: 1.45)));
}
