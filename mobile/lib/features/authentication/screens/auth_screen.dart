import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  bool isLoading = false;

  // Login controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
  TextEditingController();

  // Registration controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController signupEmailController =
  TextEditingController();
  final TextEditingController houseNameController =
  TextEditingController();
  final TextEditingController houseNumberController =
  TextEditingController();
  final TextEditingController wardController =
  TextEditingController();
  final TextEditingController localBodyController =
  TextEditingController();
  final TextEditingController addressController =
  TextEditingController();
  final TextEditingController signupPasswordController =
  TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    nameController.dispose();
    phoneController.dispose();
    signupEmailController.dispose();
    houseNameController.dispose();
    houseNumberController.dispose();
    wardController.dispose();
    localBodyController.dispose();
    addressController.dispose();
    signupPasswordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

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
              // LOGO
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
              // LOGIN / CREATE ACCOUNT
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
              // FORM
              // =====================================================

              if (isLogin)
                _buildLoginForm()
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
                  onPressed: isLoading ? null : _handleMainButton,
                  child: isLoading
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                      : Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
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
              // SWITCH
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

              const SizedBox(height: 18),

              // =====================================================
              // SECURITY MESSAGE
              // =====================================================

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
          controller: emailController,
          label: 'Mobile Number / ID / Email',
          hint: 'Enter your registered details',
          icon: Icons.person_outline_rounded,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: passwordController,
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
            onPressed: () {},
            child: const Text('Forgot Password?'),
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // REGISTRATION FORM
  // ==============================================================

  Widget _buildSignupForm() {
    return Column(
      children: [
        _textField(
          controller: nameController,
          label: 'Full Name',
          hint: 'Enter your full name',
          icon: Icons.person_outline_rounded,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: phoneController,
          label: 'Mobile Number',
          hint: 'Enter your mobile number',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: signupEmailController,
          label: 'Email',
          hint: 'Enter your email',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: houseNameController,
          label: 'House / Building Name',
          hint: 'Enter house or building name',
          icon: Icons.home_work_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: houseNumberController,
          label: 'House Number',
          hint: 'Enter house number',
          icon: Icons.tag_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: wardController,
          label: 'Ward / Area',
          hint: 'Enter ward or area',
          icon: Icons.location_on_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: localBodyController,
          label: 'Local Body / Panchayat',
          hint: 'Enter local body',
          icon: Icons.location_city_outlined,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: addressController,
          label: 'Address',
          hint: 'Enter complete address',
          icon: Icons.map_outlined,
          maxLines: 3,
        ),

        const SizedBox(height: 16),

        _textField(
          controller: signupPasswordController,
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
          controller: confirmPasswordController,
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
    TextEditingController? controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
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
  // MAIN BUTTON
  // ==============================================================

  Future<void> _handleMainButton() async {
    if (isLogin) {
      await _login();
    } else {
      await _register();
    }
  }

  // ==============================================================
  // LOGIN
  // ==============================================================

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please enter email and password');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
          'http://192.168.1.2:8080/api/auth/login',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      debugPrint('LOGIN STATUS: ${response.statusCode}');
      debugPrint('LOGIN RESPONSE: ${response.body}');

      if (!mounted) return;

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const HouseholdHomeScreen(),
          ),
        );
      } else {
        _showMessage(
          'Login failed: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (!mounted) return;

      debugPrint('LOGIN ERROR: $e');

      _showMessage(
        'Connection error: $e',
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // ==============================================================
  // REGISTRATION
  // ==============================================================

  Future<void> _register() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = signupEmailController.text.trim();
    final password = signupPasswordController.text;
    final confirmPassword =
        confirmPasswordController.text;

    // ------------------------------------------------------------
    // BASIC VALIDATION
    // ------------------------------------------------------------

    if (name.isEmpty) {
      _showMessage('Please enter your full name');
      return;
    }

    if (phone.isEmpty) {
      _showMessage('Please enter your mobile number');
      return;
    }

    if (email.isEmpty) {
      _showMessage('Please enter your email');
      return;
    }

    if (password.isEmpty) {
      _showMessage('Please create a password');
      return;
    }

    if (confirmPassword.isEmpty) {
      _showMessage('Please confirm your password');
      return;
    }

    if (password != confirmPassword) {
      _showMessage('Passwords do not match');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // ----------------------------------------------------------
      // SEND REGISTRATION REQUEST
      // ----------------------------------------------------------

      final response = await http.post(
        Uri.parse(
          'http://192.168.1.2:8080/api/auth/register',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,

          // Household account
          'role': 'HOUSEHOLD',
        }),
      );

      debugPrint(
        'REGISTER STATUS: ${response.statusCode}',
      );

      debugPrint(
        'REGISTER RESPONSE: ${response.body}',
      );

      if (!mounted) return;

      // ----------------------------------------------------------
      // SUCCESS
      // ----------------------------------------------------------

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        _showMessage(
          'Account created successfully!',
        );

        // Switch back to login
        setState(() {
          isLogin = true;

          emailController.text = email;
          passwordController.clear();

          isLoading = false;
        });
      }

      // ----------------------------------------------------------
      // EMAIL / PHONE ALREADY EXISTS
      // ----------------------------------------------------------

      else if (response.statusCode == 409) {
        _showMessage(
          'Email or mobile number already exists',
        );
      }

      // ----------------------------------------------------------
      // BAD REQUEST
      // ----------------------------------------------------------

      else if (response.statusCode == 400) {
        _showMessage(
          'Invalid registration details',
        );
      }

      // ----------------------------------------------------------
      // OTHER ERROR
      // ----------------------------------------------------------

      else {
        _showMessage(
          'Registration failed: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (!mounted) return;

      debugPrint('REGISTER ERROR: $e');

      _showMessage(
        'Connection error: $e',
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // ==============================================================
  // MESSAGE
  // ==============================================================

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
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