import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

const _blue = Color(0xFF356BFA);
const _ink = Color(0xFF202638);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Center',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _blue),
        scaffoldBackgroundColor: const Color(0xFFF6F8FF),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(bodyMedium: TextStyle(color: _ink)),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xFFF6F8FF),
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    const Text(
                      'Center',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.9,
                        color: _ink,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const _ProfileCard(),
                    const SizedBox(height: 27),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Shortcut(
                          icon: Icons.account_balance_wallet_outlined,
                          label: 'Wallet',
                        ),
                        _Shortcut(
                          icon: Icons.local_shipping_outlined,
                          label: 'Delivery',
                        ),
                        _Shortcut(
                          icon: Icons.chat_bubble_outline_rounded,
                          label: 'Message',
                          badge: '2',
                        ),
                        _Shortcut(
                          icon: Icons.support_agent_rounded,
                          label: 'Service',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 13),
                      child: Text(
                        'SETTINGS',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.6,
                          color: Color(0xFF8C94AA),
                        ),
                      ),
                    ),
                    const _SettingTile(
                      title: 'Address',
                      subtitle: 'Manage your delivery addresses',
                      icon: Icons.location_on_rounded,
                      color: Color(0xFF8A68EF),
                    ),
                    const _SettingTile(
                      title: 'Privacy',
                      subtitle: 'Your permissions and security',
                      icon: Icons.lock_rounded,
                      color: Color(0xFFEC62AC),
                    ),
                    const _SettingTile(
                      title: 'General',
                      subtitle: 'Make things feel more like you',
                      icon: Icons.layers_rounded,
                      color: Color(0xFFF5B83E),
                    ),
                    const _SettingTile(
                      title: 'Notifications',
                      subtitle: 'Stay up to date with what matters',
                      icon: Icons.notifications_rounded,
                      color: Color(0xFF42C5CC),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF477BFF), Color(0xFF285CE5)],
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: _blue.withValues(alpha: 0.24),
            blurRadius: 22,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEAF0FF),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'images/profile.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Text(
                        'WA',
                        style: TextStyle(
                          color: _blue,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ward Altal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'A programmer',
                      style: TextStyle(color: Color(0xFFDCE6FF), fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.edit_outlined, color: Colors.white, size: 19),
            ],
          ),
          const SizedBox(height: 24),
          Container(height: 1, color: Colors.white.withValues(alpha: 0.18)),
          const SizedBox(height: 19),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Statistic(value: '846', label: 'Collect'),
              _Statistic(value: '51', label: 'Attention'),
              _Statistic(value: '267', label: 'Track'),
              _Statistic(value: '39', label: 'Coupons'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Statistic extends StatelessWidget {
  const _Statistic({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFFDCE6FF), fontSize: 11),
        ),
      ],
    ),
  );
}

class _Shortcut extends StatelessWidget {
  const _Shortcut({required this.icon, required this.label, this.badge});
  final IconData icon;
  final String label;
  final String? badge;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: _ink, size: 25),
            ),
            if (badge != null)
              Positioned(
                right: -2,
                top: -3,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: _blue,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFF6F8FF),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF637BC0).withValues(alpha: 0.07),
          blurRadius: 22,
          offset: const Offset(0, 7),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 25),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: _ink,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF959CAF),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.chevron_right_rounded,
          size: 22,
          color: Color(0xFFBBC1D0),
        ),
      ],
    ),
  );
}
