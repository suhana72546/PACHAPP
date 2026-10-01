import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../authentication/screens/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppTheme.darkGreen,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Profile header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.border,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: AppTheme.softGreen,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 45,
                      color: AppTheme.primaryGreen,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Householder',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.darkGreen,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'PACHAPP User',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textMedium,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Settings
            _profileOption(
              icon: Icons.person_outline_rounded,
              title: 'Personal Information',
              onTap: () {},
            ),

            _profileOption(
              icon: Icons.language_rounded,
              title: 'Language',
              onTap: () {},
            ),

            _profileOption(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),

            const SizedBox(height: 15),

            // Logout
            _profileOption(
              icon: Icons.logout_rounded,
              title: 'Logout',
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AuthScreen(),
                  ),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border,
        ),
      ),
      child: ListTile(
        onTap: onTap,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 6,
        ),

        leading: Icon(
          icon,
          color: iconColor ?? AppTheme.primaryGreen,
          size: 27,
        ),

        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppTheme.darkGreen,
          ),
        ),

        trailing: Icon(
          Icons.chevron_right_rounded,
          color: AppTheme.textMedium,
        ),
      ),
    );
  }
}