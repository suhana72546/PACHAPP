import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../household/screens/household_home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =====================================================
              // TOP LOGO
              // =====================================================

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppTheme.softGreen,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.eco_rounded,
                        size: 42,
                        color: AppTheme.primaryGreen,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'PACHAPP',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.darkGreen,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Smart Waste Management',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textMedium,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // =====================================================
              // LOGIN / SIGN UP SWITCH
              // =====================================================

              Container(
                height: 54,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppTheme.softGreen,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _modeButton(
                        title: 'Login',
                        selected: isLogin,
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                      ),
                    ),

                    Expanded(
                      child: _modeButton(
                        title: 'Create Account',
                        selected: !isLogin,
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // =====================================================
              // TITLE
              // =====================================================

              Text(
                isLogin
                    ? 'Welcome back 👋'
                    : 'Create your account',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkGreen,
                ),
              ),

              const SizedBox(height: 7),

              Text(
                isLogin
                    ? 'Login to continue to PACHAPP'
                    : 'Create a household account to get started',
                style: const TextStyle(
                  fontSize: 15,
                  color: AppTheme.textMedium,
                ),
              ),

              const SizedBox(height: 25),

              // =====================================================
              // LOGIN FORM
              // =====================================================

              if (isLogin)
                _buildLoginForm()

              // =====================================================
              // HOUSEHOLD SIGNUP FORM
              // =====================================================

              else
                _buildSignupForm(),

              const SizedBox(height: 25),

              // =====================================================
              // MAIN BUTTON
              // =====================================================

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _handleMainButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isLogin
                            ? Icons.login_rounded
                            : Icons.person_add_alt_1_rounded,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        isLogin
                            ? 'Login'
                            : 'Create Account',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // =====================================================
              // SWITCH MESSAGE
              // =====================================================

              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? 'New to PACHAPP? Create a household account'
                        : 'Already have an account? Login',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // =====================================================
              // SECURITY MESSAGE
              // =====================================================

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.border,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      color: AppTheme.primaryGreen,
                      size: 22,
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        'Your account and personal information '
                            'are protected.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // LOGIN FORM
  // ==============================================================

  Widget _buildLoginForm() {
    return Column(
      children: [

        _textField(
          label: 'Mobile Number / ID / Email',
          hint: 'Enter your registered details',
          icon: Icons.person_outline_rounded,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Password',
          hint: 'Enter your password',
          icon: Icons.lock_outline_rounded,
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Forgot password will be implemented later.
            },
            child: const Text(
              'Forgot Password?',
            ),
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // HOUSEHOLD SIGNUP FORM
  // ==============================================================

  Widget _buildSignupForm() {
    return Column(
      children: [

        _textField(
          label: 'Full Name',
          hint: 'Enter your full name',
          icon: Icons.person_outline_rounded,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Mobile Number',
          hint: 'Enter your mobile number',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Email',
          hint: 'Optional',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'House / Building Name',
          hint: 'Enter house or building name',
          icon: Icons.home_work_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'House Number',
          hint: 'Enter house number',
          icon: Icons.tag_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Ward / Area',
          hint: 'Enter ward or area',
          icon: Icons.location_on_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Local Body / Panchayat',
          hint: 'Enter local body',
          icon: Icons.location_city_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Address',
          hint: 'Enter complete address',
          icon: Icons.map_outlined,
          maxLines: 3,
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Password',
          hint: 'Create a password',
          icon: Icons.lock_outline_rounded,
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),

        const SizedBox(height: 16),

        _textField(
          label: 'Confirm Password',
          hint: 'Re-enter your password',
          icon: Icons.lock_outline_rounded,
          obscureText: obscureConfirmPassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureConfirmPassword =
                !obscureConfirmPassword;
              });
            },
            icon: Icon(
              obscureConfirmPassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // TEXT FIELD
  // ==============================================================

  Widget _textField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    int maxLines = 1,
  }) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
      ),
    );
  }

  // ==============================================================
  // LOGIN / SIGNUP BUTTON
  // ==============================================================

  void _handleMainButton() {
    if (isLogin) {
      // TEMPORARY:
      // Until backend authentication is connected,
      // login opens the Household home screen for testing.

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HouseholdHomeScreen(),
        ),
      );
    } else {
      // Account creation will be connected to the backend later.

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Household account registration will be connected soon.',
          ),
        ),
      );
    }
  }

  // ==============================================================
  // LOGIN / SIGNUP TAB
  // ==============================================================

  Widget _modeButton({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected
                ? AppTheme.primaryGreen
                : AppTheme.textMedium,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}